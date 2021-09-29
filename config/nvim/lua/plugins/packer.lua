
-- Helper functions ---
local get_config = function(name)
  return string.format('require "plugins.%s"', name)
end

-- Config ---
local config = {
  compile_path = fn.stdpath('data') .. '/site/lua/packer_compiled.lua',
  auto_clean = true,
  max_jobs = 20,
  auto_reload_compiled = false,
  opt_default = true,
  display = {
    open_cmd = "enew",
  },
  profile = {
    enable = false,
  },
  --git ={
    --default_url_format = 'git@github.com:%s.git',
  --},
}

local plugins = {
  ----- Temp plugins -----
  {
    -- Can remove once this PR is merged & released:
    -- https://github.com/neovim/neovim/pull/15436
    opt = false,
    'lewis6991/impatient.nvim',
  },

  ----- Plugin management -----
  {
    'wbthomason/packer.nvim',
    config = get_config('packer'),
    cmd = {
      'PackerClean',
      'PackerCompile',
      'PackerInstall',
      'PackerLoad',
      'PackerProfile',
      'PackerStatus',
      'PackerSync',
      'PackerUpdate',
    },
  },

  ----- Statusline -----
  {
    'glepnir/galaxyline.nvim',
    config = get_config('galaxyline'),
  },

  ----- Session/view management -----
  {
    'rmagatti/auto-session',
    config = get_config('auto-session'),
  },

  ----- Search -----
  -- Better search with
  'junegunn/vim-slash',

  ----- Visual -----
  -- Theme(s)
  {
    'marko-cerovac/material.nvim',
    config = get_config('material'),
  },

  -- Creates groups for themes that don't support LSP yet
  'folke/lsp-colors.nvim',

  -- not stable yet, but promising
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate',
    --   config = get_config('plugins.treesitter'),
  -- },

  -- Highlights CSS colors inline
  {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    config = get_config('hexokinase'),
  },

  -- Highlight area being copied
  {
    'machakann/vim-highlightedyank',
  },

  -- Nice icons for filetypes and more
  {
    'kyazdani42/nvim-web-devicons',
  },

  -- Smooth/fast scrolling with j/k keys
  {
    'rhysd/accelerated-jk',
    config = get_config('accelerated-jk'),
  },

  -- Fade text in inactive windows (while preserving syntax)
  {
    'tadaa/vimade',
    config = get_config('vimade'),
  },

  ----- Tab management -----

  {
    -- replaces bufferline and bufkill
    'romgrk/barbar.nvim',
    config = get_config('barbar'),
  },

  ----- File explorer -----
  {
    'kyazdani42/nvim-tree.lua',
    config = get_config('nvim-tree'),
  },

  ----- Misc -----
  {
    'junegunn/vim-easy-align',
    config = get_config('easyalign'),
  },

  {
    'yuttie/comfortable-motion.vim',
    config = get_config('comfortable-motion'),
  },

  -- Vim startuptime analysis (use with nvim +StartupTime)
  'tweekmonster/startuptime.vim',

  {
    'AndrewRadev/bufferize.vim',
    cmd = { 'Bufferize', 'BufferizeTimer' }
  },

  ----- Navigation -----

  -- Undo tree visualization
  {
    'simnalamburt/vim-mundo',
    config = get_config('mundo'),
    cmd = {
      'MundoHide',
      'MundoShow',
      'MundoToggle',
    },
  },

  -- Better repeating with period command
  'tpope/vim-repeat',

  -- Pop-up cheatsheet for keyboard commands
  {
    'folke/which-key.nvim',
    config = get_config('which-key'),
  },

  -- Visual overlay to jump cursor to any part of screen
  {
    'easymotion/vim-easymotion',
    config = get_config('easymotion'),
  },

  {
    'chaoren/vim-wordmotion',
    config = get_config('wordmotion'),
    event = 'CursorMoved'
  },

  -- Navigate windows in vim and tmux with the same keys
  {
    'christoomey/vim-tmux-navigator',
    config = get_config('tmux-navigator'),
  },

  -- Fantastic fuzzy finder
  {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf',
      run = fn['fzf#install']
    },
    config = get_config('fzf'),
  },

  ----- Versioning -----

  -- Git integration
  {
    disable = true,
    'tpope/vim-fugitive',
  },

  -- Inline git blame while you type
  {
    'f-person/git-blame.nvim',
    config = get_config('blamer'),
    cmd = {
      'GitBlameEnable',
      'GitBlameDisable',
      'GitBlameToggle',
    },
  },

  -- Git integration
  {
    'chemzqm/vim-easygit',
    config = get_config('easygit'),
  },

  -- Status markers in gutter
  {
    'airblade/vim-gitgutter',
    config = get_config('gitgutter'),
  },

  -- Git commit message editing
  {
    'rhysd/committia.vim',
    config = get_config('committia'),
  },

  -- Auto-close brackets, parens, etc
    -- 'Raimondi/delimitMate', --  kinda janky
    -- 'cohama/lexima.vim', -- super janky
    'jiangmiao/auto-pairs',

  {
    'Konfekt/FastFold',
    config = get_config('fastfold'),
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
  'LnL7/vim-nix',
  {
    'fatih/vim-go',
    config = get_config('golang'),
    ft = { 'go', 'godoc' }
  },
  {
    'elzr/vim-json',
    config = 'g.vim_json_syntax_conceal = 0',
  },

  ----- Coding -----

  -- Commenting
  {
    'tyru/caw.vim',
    config = get_config('caw'),
    event = 'CursorMoved',
  },

  -- Tree view of code in file
  {
    'simrat39/symbols-outline.nvim',
    setup = get_config('symbols-outline'),
    cmd = {
      'SymbolsOutlineOpen',
      'SymbolsOutlineClose',
    }

  },

  -- Auto formatting files by syntax
  {
    'sbdchd/neoformat',
    config = get_config('neoformat'),
  },

  -- Display thin vertical lines at each indentation level
  {
    'lukas-reineke/indent-blankline.nvim',
    setup = get_config('indentline'),
    ft = {
      'lua',            'python', 'javascript',
      'javscriptreact', 'sh',     'zsh',
      'bash',           'toml',   'yaml',
      'gitconfig',      'git',    'html',
      'css',            'scss',   'sass',
    },
  },

  -- Parens matching
  {
    'andymass/vim-matchup',
    config = get_config('matchup'),
    event = 'CursorMoved',
  },

  -- Support editorconfig files in projects
  'editorconfig/editorconfig-vim',

  -- @todo is LSP a viable replacement for this?
  -- Search documentation (also works offline)
  -- {
  --   'sunaku/vim-dasht',
  --   config = get_config('dasht'),
  -- },

  -- Completion & LSP
  {
    'neovim/nvim-lspconfig',
    run = 'npm install -g typescript-language-server',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'typescriptcommon',
      'python',
      'go',
      'sh',
      'bash',
      'zsh',
    },
    requires = {
      -- {
      -- 'mattn/vim-lsp-settings', -- auto-install lsp servers
      -- requires = 'prabirshrestha/vim-lsp',
      -- }
    },
    config = get_config('nvim-lspconfig'),
  },
  {
    'kabouzeid/nvim-lspinstall',
  },
  {
    'nvim-lua/completion-nvim',
    config = get_config('completion-nvim'),
  },

  {
    'folke/lsp-trouble.nvim',
    config = get_config('lsp-trouble'),
    cmd = {
      'LspTrouble',
      'LspTroubleClose',
      'LspTroubleDocumentOpen',
      'LspTroubleDocumentToggle',
      'LspTroubleOpen',
      'LspTroubleRefresh',
      'LspTroubleToggle',
      'LspTroubleWorkspaceOpen',
      'LspTroubleWorkspaceToggle',
    },
  },

  {
    'glepnir/lspsaga.nvim',
    config = get_config('lspsaga'),
  },

  {
    'onsails/lspkind-nvim', -- lsp icons
  },
  -- @todo set this up
  -- {
  --   'mfussenegger/nvim-dap',
  --   config = get_config('dap'),
  --   requires = {
  --     'mfussenegger/nvim-dap-python',
  --     'nvim-treesitter/nvim-treesitter',
  --   }
  -- },

  -- Operations on matching chars (e.g. parens, brackets, etc)
  {
    'machakann/vim-sandwich',
    config = get_config('sandwich'),
    event = 'CursorMoved',
  },

  -- Multiple cursors
  {
    'mg979/vim-visual-multi',
    setup = get_config('visual-multi'),
  },

  -- Highlights custom words on the fly independent of search
  {
    'lfv89/vim-interestingwords',
    config = get_config('interestingwords'),
  },

  ---- Productivity -----

  -- Toggle markdown checkboxes
  {
    'jkramer/vim-checkbox',
    config = get_config('checkbox'),
  },

  -- Automagically format markdown tables as you type
  {
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'jrnl' }
  },

  ----- Writing -----
  {
    'iamcco/markdown-preview.nvim',
    -- run = fn['mkdp#util#install'],
    run = 'cd app && yarn install',
    config = get_config('markdown-preview'),
  },

  {
    disable = true,
    'glacambre/firenvim',
    run = function() fn['firenvim#install'](0) end,
    config = get_config('firenvim'),
    cond = function()
      return fn.exists('g:started_by_firenvim') == 1
    end,
  },
}

return require'packer'.startup{plugins, config = config}
