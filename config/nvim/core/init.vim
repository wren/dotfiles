" Configuration and plugin-manager manager :)
" ---
" Maintainer: Rafael Bodill
" Modified By: Jonathan Wren (to work properly with vim-plug)
" See: https://github.com/rafi/vim-config/blob/master/config/init.vim
"
" Plugin-manager agnostic initialization and user configuration parsing
"

" Set custom augroup
augroup user_events
	autocmd!
augroup END

" Initializes options
let s:package_manager = get(g:, 'etc_package_manager', 'plug')
if empty(s:package_manager) || s:package_manager ==# 'none'
	finish
endif

let s:vim_path =
	\ get(g:, 'etc_vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
	\   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )

let s:cache_path =
	\ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

let s:config_paths = get(g:, 'etc_config_paths', [
	\ s:vim_path . '/core/plugins.yaml',
	\ s:vim_path . '/core/plugins.json',
	\ s:vim_path . '/vimrc.yaml',
	\ s:vim_path . '/vimrc.json',
	\ ])

" Filter non-existent directories
call filter(s:config_paths, 'filereadable(v:val)')

function! s:use_plug() abort
	" vim-plug package-manager initialization
	let l:cache_root = $DATA_PATH . '/plug'
	let l:cache_init = l:cache_root . '/init.vimplug'
	let l:cache_repos = l:cache_root . '/repos'

	augroup user_plugin_vimplug
		autocmd!
	augroup END

	if &runtimepath !~# '/init.vimplug'

		if ! isdirectory(l:cache_init)
			silent !curl -fLo $DATA_PATH/plug/init.vimplug/autoload/plug.vim
				\ --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

			autocmd user_plugin_vimplug VimEnter * PlugInstall --sync | source $MYVIMRC
		endif

		execute 'set runtimepath+='.substitute(
			\ fnamemodify(l:cache_init, ':p') , '/$', '', '')
	endif

	let l:rc = s:parse_config_files()
	if empty(l:rc)
		call s:error('Empty plugin list')
		return
	endif

	for plugin in l:rc
		if has_key(plugin, 'hook_pre_source')
			execute plugin['hook_pre_source']
		endif
	endfor

	call plug#begin(l:cache_repos)
	for plugin in l:rc
		call plug#(plugin['repo'], extend(plugin, {}, 'keep'))
		if has_key(plugin, 'hook_source')
			execute plugin['hook_source']
		endif
	endfor
	call plug#end()

	for plugin in l:rc
		if has_key(plugin, 'hook_post_source')
			execute plugin['hook_post_source']
		endif
	endfor
endfunction

function! s:parse_config_files()
	let l:merged = []
	try
		" Merge all lists of plugins together
		for l:cfg_file in s:config_paths
			let l:merged = extend(l:merged, s:load_config(l:cfg_file))
		endfor
	catch /.*/
		call s:error(
			\ 'Unable to read configuration files at ' . string(s:config_paths))
		echoerr v:exception
		echomsg 'Error parsing user configuration file(s).'
		echoerr 'Please run: pip install PyYAML'
		echomsg 'Caught: ' v:exception
	endtry

	" If there's more than one config file source,
	" de-duplicate plugins by repo key.
	if len(s:config_paths) > 1
		call s:dedupe_plugins(l:merged)
	endif
	return l:merged
endfunction

function! s:dedupe_plugins(list)
	let l:list = reverse(a:list)
	let l:i = 0
	let l:seen = {}
	while i < len(l:list)
		let l:key = list[i]['repo']
		if l:key !=# '' && has_key(l:seen, l:key)
			call remove(l:list, i)
		else
			if l:key !=# ''
				let l:seen[l:key] = 1
			endif
			let l:i += 1
		endif
	endwhile
	return reverse(l:list)
endfunction

" General utilities, mainly for dealing with user configuration parsing
" ---

function! s:error(msg)
	for l:mes in s:str2list(a:msg)
		echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
	endfor
endfunction

function! s:debug(msg)
	for l:mes in s:str2list(a:msg)
		echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
	endfor
endfunction

function! s:load_config(filename)
	" Parse YAML/JSON config file
	if a:filename =~# '\.json$'
		" Parse JSON with built-in json_decode
		let l:json = readfile(a:filename)
		return has('nvim') ? json_decode(l:json) : json_decode(join(l:json))
	elseif a:filename =~# '\.ya\?ml$'
		" Parse YAML with common command-line utilities
		return s:load_yaml(a:filename)
	endif
	call s:error('Unknown config file format ' . a:filename)
	return ''
endfunction

function! s:str2list(expr)
	" Convert string to list
	return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction

" YAML related
" ---

let g:yaml2json_method = 'python'

function! s:load_yaml(filename)
	if empty(g:yaml2json_method)
		let g:yaml2json_method = s:find_yaml2json_method()
	endif

	if g:yaml2json_method ==# 'ruby'
		let l:cmd = "ruby -e 'require \"json\"; require \"yaml\"; ".
			\ "print JSON.generate YAML.load \$stdin.read'"
	elseif g:yaml2json_method ==# 'python'
		let l:cmd = "python -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))'"
	elseif g:yaml2json_method ==# 'yq'
		let l:cmd = 'yq .'
	else
		let l:cmd = g:yaml2json_method
	endif

	try
		let l:raw = readfile(a:filename)
		return json_decode(system(l:cmd, l:raw))
	catch /.*/
		call s:error([
			\ string(v:exception),
			\ 'Error loading ' . a:filename,
			\ 'Caught: ' . string(v:exception),
			\ 'Please run: pip install --user PyYAML',
			\ ])
	endtry
endfunction

function! s:find_yaml2json_method()
	if !exists('*json_decode')
		call s:error('Please upgrade to neovim +v0.1.4 or vim: +v7.4.1304')
	endif

	" Try python since we know it's in the neovim virtualenv
	if executable('python') && s:test_python_yaml()
		return 'python'

	" Try yq since it's simple and fast
	elseif executable('yq')
		return 'yq'

	" Or try a CLI tool named yaml2json (lots of versions available)
	elseif executable('yaml2json') && s:test_yaml2json()
		return 'yaml2json'

	" Or, try ruby. Which is installed on every macOS by default
	" and has ruby built-in.
	elseif executable('ruby') && s:test_ruby_yaml()
		return 'ruby'
	endif

	call s:error('Unable to find a proper YAML parsing utility')
endfunction

function! s:test_yaml2json()
	" Test yaml2json capabilities
	try
		let result = system('yaml2json', "---\ntest: 1")
		if v:shell_error != 0
			return 0
		endif
		let result = json_decode(result)
		return result.test
	catch
	endtry
	return 0
endfunction

function! s:test_ruby_yaml()
	" Test Ruby YAML capabilities
	call system("ruby -e 'require \"json\"; require \"yaml\"'")
	return (v:shell_error == 0) ? 1 : 0
endfunction

function! s:test_python_yaml()
	" Test Python YAML capabilities
	call system("python -c 'import sys,yaml,json'")
	return (v:shell_error == 0) ? 1 : 0
endfunction

" Initializes chosen package manager
call s:use_{s:package_manager}()

" vim: set ts=2 sw=2 tw=80 noet :
