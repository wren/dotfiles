
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
    opt = true,
  },

  ----- Statusline -----
  {
    'glepnir/galaxyline.nvim',
    config = function() require 'plugins.galaxyline' end,
  },

  ----- Session/view management -----
  -- 'vim-scripts/restore_view.vim',
  -- 'tpope/vim-obsession',

  -- Enhance terminal compatibility (especially w/ tmux)
  -- 'wincent/terminus',

  ----- Search -----

  -- Better search with
  {
    'junegunn/vim-oblique',
    requires = 'junegunn/vim-pseudocl'
  },

  ----- Visual -----
  'joshdick/onedark.vim',

  -- Highlights CSS colors inline
  {
    'RRethy/vim-hexokinase',
    config = function() require 'plugins.hexokinase' end,
    run = 'make hexokinase',
  },

  -- Highlight area being copied
  'machakann/vim-highlightedyank',

  -- Nice icons for filetypes and more
  'kyazdani42/nvim-web-devicons',

  -- Smooth/fast scrolling with j/k keys
  {
    'rhysd/accelerated-jk',
    config = function() require 'plugins.accelerated-jk' end,
  },

  -- Fade text in inactive windows (while preserving syntax)
  -- Causes vimenter autocommand lag
  -- Worth keeping?
  -- 'tadaa/vimade',

  ----- Tab management -----
  {
    'akinsho/nvim-bufferline.lua',
    config = function() require 'plugins.bufferline' end,
  },
  {
    'qpkorr/vim-bufkill', -- buffer delete while preserving windows
    config = function() require 'plugins.bufkill' end,
  },

  ----- File explorer -----

  {
    'Shougo/defx.nvim',
    run = function() cmd [[UpdateRemotePlugins]] end,
    config = function() require 'plugins.defx' end,
    requires = {
      'kristijanhusak/defx-git',
      'kristijanhusak/defx-icons',
    }
  },

  ----- Misc -----

  {
    'junegunn/vim-easy-align',
    config = function() require 'plugins.easyalign' end,
  },

  {
    'godlygeek/tabular', -- Text alignment
    config = function() require 'plugins.tabular' end,
  },

  {
    'yuttie/comfortable-motion.vim',
    config = function() require 'plugins.comfortable-motion' end,
  },

  -- Vim startuptime analysis (use with nvim +StartupTime)
  'dstein64/vim-startuptime',
  -- 'tweekmonster/startuptime.vim',

  ----- Navigation -----

  -- Undo tree visualization
  {
    'simnalamburt/vim-mundo',
    config = function() require 'plugins.mundo' end,
  },

  -- Better repeating with period command
  'tpope/vim-repeat',

  -- Pop-up cheatsheet for keyboard commands
  {
    'liuchengxu/vim-which-key',
    config = function() require 'plugins.which-key' end,
  },

  -- Visual overlay to jump cursor to any part of screen
  {
    'easymotion/vim-easymotion',
  },

  -- More control over what motions apply to (like word separators)
  'wellle/targets.vim',

  {
    'chaoren/vim-wordmotion',
    config = function() require 'plugins.wordmotion' end,
  },


  -- Navigate windows in vim and tmux with the same keys
  {
    'christoomey/vim-tmux-navigator',
    config = function() require 'plugins.tmux-navigator' end,
  },

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
  {
    'chemzqm/vim-easygit',
    config = function() require 'plugins.easygit' end,
  },

  -- Status markers in gutter
  {
    'airblade/vim-gitgutter',
    config = function() require 'plugins.gitgutter' end,
  },

  -- Git commit message editing
  'rhysd/committia.vim',

  ----- Languages and syntax -----
  'honza/dockerfile.vim',
  'junegunn/vim-emoji',
  'Vimjas/vim-python-pep8-indent',
  'vim-python/python-syntax',
  'neoclide/vim-jsx-improve',
  'cespare/vim-toml',
  'tpope/vim-cucumber',
  'tmux-plugins/vim-tmux',
  {
    'fatih/vim-go',
    config = function() require 'plugins.golang' end,
  },
  {
    'elzr/vim-json',
    config = function() g.vim_json_syntax_conceal = 0 end,
  },

  ----- Coding -----

  -- Commenting
  {
    'tyru/caw.vim',
    config = function() require 'plugins.caw' end,
  },

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

  -- Parens matching
  -- 'luochen1990/rainbow',
  'andymass/vim-matchup',

  -- Support editorconfig files in projects
  'editorconfig/editorconfig-vim',

  -- Show function signature
  -- 'Shougo/echodoc.vim',

  -- Search documentation (also works offline)
  {
    'sunaku/vim-dasht',
    config = function() require 'plugins.dasht' end,
  },

  -- Completion & LSP

  {
    'neovim/nvim-lspconfig',
    run = [[
      npm install -g typescript-language-server
    ]],
    requires = {
      'onsails/lspkind-nvim', -- icons
      'prabirshrestha/vim-lsp',
      'mattn/vim-lsp-settings',
    },
    config = function() require 'plugins.nvim-lspconfig' end,
  },

  {
    'nvim-lua/completion-nvim',
    config = function() require 'plugins.completion-nvim' end,
  },

  {
    'mfussenegger/nvim-dap',
    config = function() require 'plugins.dap' end,
    requires = {
      'mfussenegger/nvim-dap-python',
      'nvim-treesitter/nvim-treesitter',
    }
  },

  -- Operations on matching chars (e.g. parens, brackets, etc)
  'machakann/vim-sandwich',

  -- Multiple cursors
  -- 'mg979/vim-visual-multi',

  {
    'lfv89/vim-interestingwords',
    config = function() require 'plugins.interestingwords' end,
  },

  ---- Productivity -----

  -- Toggle markdown checkboxes
  {
    'jkramer/vim-checkbox',
    config = function() require 'plugins.checkbox' end,
  },

  ----- Writing -----
  {
    'iamcco/markdown-preview.nvim',
    -- run = vim.fn['mkdp#util#install'],
    run = 'cd app && yarn install',
    config = function() require 'plugins.markdown-preview' end,
  },

}

require('packer').startup {plugins, config = config_overrides}

-- After loading plugins --
require 'plugins.easymotion'

