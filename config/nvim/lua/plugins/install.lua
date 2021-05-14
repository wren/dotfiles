
local compile_path = fn.stdpath('data') .. '/packer'
vim.cmd('set rtp+=' .. compile_path)

local config_overrides = {
  compile_path = compile_path .. '/plugin/packer_compiled.vim',
  display = {
    -- non_interactive = true, -- If true, disable display windows for all operations
    open_cmd = '165vnew [packer]', -- An optional command to open a window for packer's display
  },
  -- profile = {
  --   enable = true,
  --   threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
  -- }
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
    config = "require 'plugins.galaxyline'",
  },

  ----- Session/view management -----

  -- Enhance terminal compatibility (especially w/ tmux)
  -- @todo what does this actually do?
  -- 'wincent/terminus',

  {
    'rmagatti/auto-session',
    config = "require 'plugins.auto-session'",
  },

  ----- Search -----
  -- Better search with
  'junegunn/vim-slash',

  ----- Visual -----
  -- Theme(s)
  'marko-cerovac/material.nvim',

  -- Creates groups for themes that don't support LSP yet
  'folke/lsp-colors.nvim',

  -- not stable yet, but promising
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate',
  --   config = "require 'plugins.treesitter'",
  -- },

  -- Highlights CSS colors inline
  {
    'RRethy/vim-hexokinase',
    config = "require 'plugins.hexokinase'",
    run = 'make hexokinase',
  },

  -- Highlight area being copied
  {
    'machakann/vim-highlightedyank',
    opt = true,
  },

  -- Nice icons for filetypes and more
  'kyazdani42/nvim-web-devicons',

  -- Smooth/fast scrolling with j/k keys
  {
    'rhysd/accelerated-jk',
    config = "require 'plugins.accelerated-jk'",
  },

  -- Fade text in inactive windows (while preserving syntax)
  {
    'tadaa/vimade',
    config = "require 'plugins.vimade'",
  },

  ----- Tab management -----
  {
    'akinsho/nvim-bufferline.lua',
    config = "require 'plugins.bufferline'",
  },
  {
    'qpkorr/vim-bufkill', -- buffer delete while preserving windows
    opt = true,
    config = "require 'plugins.bufkill'",
  },

  ----- File explorer -----

  -- {
  --   'Shougo/defx.nvim',
  --   run = function() cmd [[UpdateRemotePlugins]] end,
  --   config = function() require 'plugins.defx' end,
  --   requires = {
  --     'kristijanhusak/defx-git',
  --     'kristijanhusak/defx-icons',
  --   }
  -- },

  -- Trying nerdtree for a while
  {
    'preservim/nerdtree',
    cmd = {
      'NERDTree',
      'NERDTree',
      'NERDTreeCWD',
      'NERDTreeClose',
      'NERDTreeFind',
      'NERDTreeFocus',
      'NERDTreeFromBookmark',
      'NERDTreeMirror',
      'NERDTreeRefreshRoot',
      'NERDTreeToggle',
      'NERDTreeToggleVCS',
      'NERDTreeVCS',
    }
  },

  ----- Misc -----
  {
    'junegunn/vim-easy-align',
    config = "require 'plugins.easyalign'",
  },

  {
    'yuttie/comfortable-motion.vim',
    config = "require 'plugins.comfortable-motion'",
  },

  -- Vim startuptime analysis (use with nvim +StartupTime)
  'tweekmonster/startuptime.vim',

  ----- Navigation -----

  -- Undo tree visualization
  {
    'simnalamburt/vim-mundo',
    config = "require 'plugins.mundo'",
  },

  -- Better repeating with period command
  'tpope/vim-repeat',

  -- Pop-up cheatsheet for keyboard commands
  {
    'folke/which-key.nvim',
    config = "require 'plugins.which-key'",
  },

  -- Visual overlay to jump cursor to any part of screen
  {
    'easymotion/vim-easymotion',
    setup = function() require 'plugins.easymotion' end,
  },

  {
    'chaoren/vim-wordmotion',
    config = "require 'plugins.wordmotion'",
  },

  -- Navigate windows in vim and tmux with the same keys
  {
    'christoomey/vim-tmux-navigator',
    config = "require 'plugins.tmux-navigator'",
  },

  -- Fantastic fuzzy finder
  {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = fn['fzf#install']
    },
    config = "require 'plugins.fzf'"
  },

  ----- Versioning -----

  -- Git integration
  'tpope/vim-fugitive',

  -- Inline git blame while you type
  {
    'f-person/git-blame.nvim',
    config = "require 'plugins.blamer'",
  },

  -- Git integration
  {
    'chemzqm/vim-easygit',
    config = "require 'plugins.easygit'",
  },

  -- Status markers in gutter
  {
    'airblade/vim-gitgutter',
    config = "require 'plugins.gitgutter'",
  },

  -- Git commit message editing
  {
    'rhysd/committia.vim',
    config = "require 'plugins.committia'",
  },

  -- Auto-close brackets, parens, etc
    -- 'Raimondi/delimitMate', --  kinda janky
    -- 'cohama/lexima.vim', -- super janky
    'jiangmiao/auto-pairs',

  {
    'Konfekt/FastFold',
    config = "require 'plugins.fastfold'",
  },

  ----- Languages and syntax -----
  'honza/dockerfile.vim',
  'junegunn/vim-emoji',
  'Vimjas/vim-python-pep8-indent',
  'vim-python/python-syntax',
  'neoclide/vim-jsx-improve',
  'cespare/vim-toml',
  'tpope/vim-cucumber',
  'tmux-plugins/vim-tmux',
  'wren/jrnl.vim',
  'jparise/vim-graphql',
  {
    'fatih/vim-go',
    config = "require 'plugins.golang'",
  },
  {
    'elzr/vim-json',
    config = function() g.vim_json_syntax_conceal = 0 end,
  },

  ----- Coding -----

  -- Commenting
  {
    'tyru/caw.vim',
    config = "require 'plugins.caw'",
  },

  -- Tree view of code in file
  {
    'simrat39/symbols-outline.nvim',
    setup = function() require 'plugins.symbols-outline' end,
  },

  -- Auto formatting files by syntax
  {
    'sbdchd/neoformat',
    config = "require 'plugins.neoformat'",
  },

  -- Display thin vertical lines at each indentation level
  {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = "require 'plugins.indentline'",
  },

  -- Parens matching
  {
    'andymass/vim-matchup',
    config = "require 'plugins.matchup'",
  },

  -- Support editorconfig files in projects
  'editorconfig/editorconfig-vim',

  -- @todo is LSP a viable replacement for this?
  -- Search documentation (also works offline)
  -- {
  --   'sunaku/vim-dasht',
  --   config = "require 'plugins.dasht'",
  -- },

  -- Completion & LSP
  {
    opt = true,
    'neovim/nvim-lspconfig',
    run = 'npm install -g typescript-language-server',
    requires = {
      'onsails/lspkind-nvim', -- icons
      -- {
      -- 'mattn/vim-lsp-settings', -- auto-install lsp servers
      -- requires = 'prabirshrestha/vim-lsp',
      -- }
    },
    config = "require 'plugins.nvim-lspconfig'",
  },
  {
    'nvim-lua/completion-nvim',
    config = "require 'plugins.completion-nvim'",
  },
  {
    'folke/lsp-trouble.nvim',
    opt = true,
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require 'plugins.lsp-trouble'",
  },

  {
    'glepnir/lspsaga.nvim',
    opt = true,
    requires = 'neovim/nvim-lspconfig',
    config = "require 'plugins.lspsaga'",
  },

  -- @todo set this up
  -- {
  --   'mfussenegger/nvim-dap',
  --   config = "require 'plugins.dap'",
  --   requires = {
  --     'mfussenegger/nvim-dap-python',
  --     'nvim-treesitter/nvim-treesitter',
  --   }
  -- },

  -- Operations on matching chars (e.g. parens, brackets, etc)
  {
    'machakann/vim-sandwich',
    config = "require 'plugins.sandwich'",
  },

  -- Multiple cursors
  {
    'mg979/vim-visual-multi',
    setup = function() require 'plugins.visual-multi' end,
  },

  -- Highlights custom words on the fly independent of search
  {
    'lfv89/vim-interestingwords',
    config = "require 'plugins.interestingwords'",
  },

  ---- Productivity -----

  -- Toggle markdown checkboxes
  {
    'jkramer/vim-checkbox',
    config = "require 'plugins.checkbox'",
  },

  -- Automagically format markdown tables as you type
  'dhruvasagar/vim-table-mode',

  ----- Writing -----
  {
    'iamcco/markdown-preview.nvim',
    -- run = fn['mkdp#util#install'],
    run = 'cd app && yarn install',
    config = "require 'plugins.markdown-preview'",
  },
}

require('packer').startup {plugins, config = config_overrides}

