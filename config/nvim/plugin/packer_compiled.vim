" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

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

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/ansible-vim"
  },
  ["blamer.nvim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/blamer.nvim"
  },
  ["caw.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/caw.vim"
  },
  chadtree = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/chadtree"
  },
  ["comfortable-motion.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/comfortable-motion.vim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["dockerfile.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/dockerfile.vim"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0" },
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0" },
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  indentLine = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  neoformat = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["python-syntax"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/python-syntax"
  },
  ["restore_view.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/restore_view.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  terminus = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/terminus"
  },
  ["vim-applescript"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-applescript"
  },
  ["vim-checkbox"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-checkbox"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-cucumber"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-cucumber"
  },
  ["vim-dasht"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-dasht"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easygit"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-easygit"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-emoji"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-emoji"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-interestingwords"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-interestingwords"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-jsx-improve"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-jsx-improve"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-oblique"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-oblique"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-pseudocl"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-pseudocl"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-tmux"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-tmux"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vim-wordmotion"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["xml.vim"] = {
    loaded = true,
    path = "/Users/jonathan/.local/share/nvim/site/pack/packer/start/xml.vim"
  }
}

-- Config for: fzf.vim
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0", "config", "fzf.vim")
-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0", "config", "nvim-bufferline.lua")
-- Config for: galaxyline.nvim
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.galaxyline\frequire\0", "config", "galaxyline.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
