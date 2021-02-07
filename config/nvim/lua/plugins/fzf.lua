
cmd 'set rtp+=/usr/local/opt/fzf'


g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}


g.fzf_colors = {
  fg      = {'fg', 'Normal'},
  bg      = {'bg', 'Normal'},
  hl      = {'fg', 'Comment'},
  ['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
  ['bg+'] = {'bg', 'CursorLine', 'CursorColumn'},
  ['hl+'] = {'fg', 'Statement'},
  info    = {'fg', 'PreProc'},
  border  = {'fg', 'Ignore'},
  prompt  = {'fg', 'Conditional'},
  pointer = {'fg', 'Exception'},
  marker  = {'fg', 'Keyword'},
  spinner = {'fg', 'Label'},
  header  = {'fg', 'Comment'}
}


g.fzf_commits_log_options = '--graph --color=always'..
  '--format="%C(yellow)%h%C(red)%d%C(reset)'..
  '- %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'


-- ripgrep
if fn.executable('rg') == 1 then
  cmd [[let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!**/node_modules/*" --glob "!**/__pycache__/*" 2> /dev/null']]
  set.grepprg = 'rg --vimgrep'
  -- @todo make this lua
  cmd [[command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)]]
end


cmd "let $FZF_DEFAULT_OPTS='--layout=reverse'"
g.fzf_layout = { window = 'call FloatingFZF()' }


-- @todo This one needs a lot of work to migrate to lua (worth it, but will do later)
cmd(string.format('source %s/legacy/fzf.vim', fn.stdpath('config')))

-- Keymap --
silent = { silent = true }
map('n', '<leader>fb', ':Buffers<CR>', silent)
map('n', '<leader>ft', ':Filetypes<CR>', silent)
map('n', '<M-C-p>', ':Buffers<CR>', silent)
map('n', '<C-p>', ':call Fzf_dev()<CR>', silent)
map('n', '<leader>fp', ':call Fzf_dev()<CR>')
map('n', '<leader>ff', ':Find<Space>')
map('n', '<leader>fm', ':Maps<CR>')
map('n', '<leader>fc', ':Commands<CR>')
map('n', '<leader>fhf', ':History<CR>')
map('n', '<leader>fhc', ':History:<CR>')
map('n', '<leader>fhs', ':History/<CR>')
map('n', '<leader>fs', ':Colors<CR>', silent)
map('n',  '<leader>fw', ':Find <C-R><C-W><CR>', silent)
map('n',  'z=', ':call FzfSpell()<CR>', silent)
