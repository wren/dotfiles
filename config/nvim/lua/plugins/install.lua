
local compile_path = vim.fn.stdpath('data') .. '/packer'
vim.cmd('set rtp+=' .. compile_path)

local config_overrides = {
  compile_path = compile_path .. '/plugin/packer_compiled.vim',
  display = {
    -- non_interactive = true, -- If true, disable display windows for all operations
    open_cmd = '165vnew [packer]', -- An optional command to open a window for packer's display
  }
}

local plugins = {
  ----- Plugin management -----
  {
    'wbthomason/packer.nvim',
    opt = true
  },

  ----- Statusline -----
  {
    'glepnir/galaxyline.nvim',
    config = function() require 'plugins.galaxyline' end,
  },

  ----- Session/view management -----
  'vim-scripts/restore_view.vim',
  'tpope/vim-obsession',

  -- Enhance terminal compatibility (especially w/ tmux)
  'wincent/terminus',

  ----- Search -----

  -- Better search with
  'junegunn/vim-pseudocl',
  'junegunn/vim-oblique',

  ----- Visual -----
  'joshdick/onedark.vim',

  -- Highlights CSS colors inline
  'ap/vim-css-color',

  -- Highlight area being copied
  'machakann/vim-highlightedyank',

  -- Nice icons for filetypes and more
  'kyazdani42/nvim-web-devicons',

  -- Smooth/fast scrolling with j/k keys
  'rhysd/accelerated-jk',

  -- Fade text in inactive windows (while preserving syntax)
  -- Causes vimenter autocommand lag
  -- Worth keeping?
  -- 'tadaa/vimade',

  ----- Tab management -----

  -- {
    -- 'romgrk/barbar.nvim', 
    -- config = function() require 'plugins.barbar' end
  -- }

  {
    'akinsho/nvim-bufferline.lua',
    config = function() require 'plugins.bufferline' end
  },

  ----- File explorer -----

  -- {'Shougo/defx.nvim', run = function() vim.cmd [[UpdateRemotePlugins]] end },
  -- 'kristijanhusak/defx-git',
  -- 'kristijanhusak/defx-icons',

  {
    'ms-jpq/chadtree', 
    branch = 'chad',
    run = 'python -m chadtree deps',
    config = function() require 'plugins.chadtree' end,
  },

  ----- Misc -----

  'junegunn/vim-easy-align',

  'godlygeek/tabular',

  'yuttie/comfortable-motion.vim',

  -- Vim startuptime analysis (use with nvim +StartupTime)
  'dstein64/vim-startuptime',

  ----- Navigation -----

  -- Undo tree visualization
  'simnalamburt/vim-mundo',

  -- Better repeating with period command
  'tpope/vim-repeat',

  -- Pop-up cheatsheet for keyboard commands
  {
    'liuchengxu/vim-which-key',
    config = function() require 'plugins.which-key' end,
  },

  -- Visual overlay to jump cursor to any part of screen
  'easymotion/vim-easymotion',

  -- More control over what motions apply to (like word separators)
  'wellle/targets.vim',
  'chaoren/vim-wordmotion',

  -- Navigate windows in vim and tmux with the same keys
  'christoomey/vim-tmux-navigator',

  -- Fantastic fuzzy finder
  {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = vim.fn['fzf#install']
    },
    config = function() require 'plugins.fzf' end
  },

  ----- Versioning -----

  -- Git integration
  'tpope/vim-fugitive',

  -- Inline git blame while you type
  {
    'apzelos/blamer.nvim',
    config = function() require 'plugins.blamer' end,
  },

  -- Git integration
  'chemzqm/vim-easygit',

  -- Status markers in gutter
  {
    'airblade/vim-gitgutter',
    config = function() require 'plugins.gitgutter' end,
  },

  'rhysd/committia.vim',

  ----- Languages -----

  'honza/dockerfile.vim',

  'junegunn/vim-emoji',

  'Vimjas/vim-python-pep8-indent',

  'vim-python/python-syntax',

  'neoclide/vim-jsx-improve',

  'vim-scripts/xml.vim',

  'pearofducks/ansible-vim',

  'cespare/vim-toml',

  'elzr/vim-json',

  'dearrrfish/vim-applescript',

  'tpope/vim-cucumber',

  {
    'fatih/vim-go',
    config = function() require 'plugins.golang' end,
  },

  'tmux-plugins/vim-tmux',

  ----- Coding -----

  -- Commenting
  'tyru/caw.vim',

  -- Auto formatting files by syntax
  {
    'sbdchd/neoformat',
    config = function() require 'plugins.neoformat' end,
  },

  -- Display thin vertical lines at each indentation level
  {
    'Yggdroot/indentLine',
    config = function() require 'plugins.indentline' end
  },

  -- LSP support for tags
  'liuchengxu/vista.vim',

  -- Parens matching
  -- 'luochen1990/rainbow',
  'andymass/vim-matchup',

  -- Support editorconfig files in projects
  'editorconfig/editorconfig-vim',

  -- Show function signature
  'Shougo/echodoc.vim',

  -- Search documentation (also works offline)
  'sunaku/vim-dasht',

  -- Completion engine
  -- Causes startup lag. Worth keeping?
  -- {'ycm-core/YouCompleteMe', run = './install.py --all' },

  -- Operations on matching charcs (e.g. parens, brackets, etc)
  'machakann/vim-sandwich',

  -- Multiple cursors
  'mg979/vim-visual-multi',

  'lfv89/vim-interestingwords',

  ---- Productivity -----

  -- Toggle markdown checkboxes
  'jkramer/vim-checkbox',

  ----- Writing -----

  -- {'iamcco/markdown-preview.nvim', run = vim.fn['mkdp#util#install']},


}

return require('packer').startup {plugins, config = config_overrides}
