" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif
try

lua << END
  local package_path_str = "/Users/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/Users/jonathan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["ansible-vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/ansible-vim"
  },
  ["blamer.nvim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["caw.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/caw.vim"
  },
  ["comfortable-motion.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/comfortable-motion.vim"
  },
  ["committia.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["dockerfile.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/dockerfile.vim"
  },
  ["echodoc.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  fzf = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  indentLine = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  neoformat = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["python-syntax"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/python-syntax"
  },
  ["restore_view.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/restore_view.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  tabular = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  terminus = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/terminus"
  },
  ["vim-applescript"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-applescript"
  },
  ["vim-checkbox"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-checkbox"
  },
  ["vim-css-color"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-cucumber"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-cucumber"
  },
  ["vim-dasht"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-dasht"
  },
  ["vim-easy-align"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easygit"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-easygit"
  },
  ["vim-easymotion"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-emoji"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-emoji"
  },
  ["vim-fugitive"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-interestingwords"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-interestingwords"
  },
  ["vim-json"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-jsx-improve"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-jsx-improve"
  },
  ["vim-matchup"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-mundo"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-oblique"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-oblique"
  },
  ["vim-obsession"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-pseudocl"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-pseudocl"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-startuptime"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-tmux"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-toml"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-which-key"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  ["vista.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["xml.vim"] = {
    loaded = true,
    only_sequence = true,
    only_setup = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/xml.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = packer_plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

local packer_load = nil
local function handle_after(name, before)
  local plugin = packer_plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    packer_load({name}, {})
  end
end

packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if packer_plugins[name].commands then
      for _, cmd in ipairs(packer_plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if packer_plugins[name].keys then
      for _, key in ipairs(packer_plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not packer_plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if packer_plugins[name].config then
        for _i, config_line in ipairs(packer_plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if packer_plugins[name].after then
        for _, after_name in ipairs(packer_plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      packer_plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local escaped_keys = vim.api.nvim_replace_termcodes(cause.keys .. extra, true, true, true)
    vim.api.nvim_feedkeys(escaped_keys, 'm', true)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

_packer_load_wrapper = function(names, cause)
  success, err_msg = pcall(packer_load, names, cause)
  if not success then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "Error in packer_compiled: ' .. vim.fn.escape(err_msg, '"') .. '"')
    vim.cmd('echomsg "Please check your config for correctness"')
    vim.cmd('echohl None')
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: galaxyline.nvim
loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0")()
-- Config for: fzf.vim
loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0")()
-- Config for: nvim-bufferline.lua
loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
  call luaeval('_packer_load_wrapper(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  " Event lazy-loads
  " Function lazy-loads
augroup END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
