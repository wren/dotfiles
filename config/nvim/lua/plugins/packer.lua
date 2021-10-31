
-- Helper functions ---
local get_config = function(name)
  return string.format('require "plugins.%s"', name)
end

local lsp_filetypes = {
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
  'lua',
}

local jrnl_filetypes = {
  'markdown',
  'jrnl',
}

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

  ----- Global Dependencies -----
  {
    'nvim-lua/plenary.nvim',
    event = 'CursorMoved',
    module = {
      'telescope',
      'gitsigns',
    }
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
    'nvim-lualine/lualine.nvim',
    config = get_config('lualine'),
    event = 'CursorMoved',
  },

  ----- Session/view management -----
  {
    'rmagatti/auto-session',
    config = get_config('auto-session'),
    keys = {
      '<leader>ss',
      '<leader>sr',
      '<leader>sd',
    },
    event = 'CursorMoved',
  },

  ----- Search -----
  -- Better search with slash
  {
    'junegunn/vim-slash',
    keys = '/',
  },

  ----- Visual -----
  -- Startup

  {
    opt = false,
    'goolord/alpha-nvim',
    config = get_config('dashboard'),
  },

  -- Theme(s)
  {
    opt = false,
    'EdenEast/nightfox.nvim',
    config = get_config('nightfox'),
  },

  -- Highlights CSS colors inline
  {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    setup = get_config('hexokinase'),
    event = 'CursorMoved',
  },

  -- Highlight area being copied
  {
    'machakann/vim-highlightedyank',
    event = 'TextYankPost',
  },

  -- Nice icons for filetypes and more
  {
    opt = false,
    'kyazdani42/nvim-web-devicons',
  },

  -- Smooth/fast scrolling
  {
    'rhysd/accelerated-jk',
    config = get_config('accelerated-jk'),
    keys = { 'j', 'k' }
  },

  {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    config = get_config('neoscroll'),
  },


  -- Fade text in inactive windows (while preserving syntax)
  {
    'tadaa/vimade',
    config = get_config('vimade'),
    event = 'CursorMoved',
  },

  ----- Tab management -----

  {
    -- replaces bufferline and bufkill
    'romgrk/barbar.nvim',
    config = get_config('barbar'),
    event = 'CursorMoved',
  },

  ----- File explorer -----
  {
    'kyazdani42/nvim-tree.lua',
    config = get_config('nvim-tree'),
    cmd = {
      'NvimTreeToggle',
      'NvimTreeRefresh',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeClose',
      'NvimTreeFocus',
    },
    keys = {
      '<leader>eo',
      '<leader>ef',
    },
  },

  ----- Misc -----
  {
    'junegunn/vim-easy-align',
    config = get_config('easyalign'),
    ft = jrnl_filetypes,
    keys = {
      '<leader>ga',
    },
  },

  -- Vim startuptime analysis (use with nvim +StartupTime)
  {
    'tweekmonster/startuptime.vim',
    cmd = {
      'StartupTime',
    },
  },

  -- Put output from commands into a buffer
  {
    'AndrewRadev/bufferize.vim',
    cmd = {
      'Bufferize',
      'BufferizeTimer',
      'BufferizeSystem',
    }
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
  {
    'tpope/vim-repeat',
    keys = '.',
  },

  -- Pop-up cheatsheet for keyboard commands
  {
    opt = false,
    'folke/which-key.nvim',
    config = get_config('which-key'),
  },

  -- Visual overlay to jump cursor to any part of screen
  {
    disable = true,
    'easymotion/vim-easymotion',
    config = get_config('easymotion'),
    event = 'CursorMoved',
  },

  {
    opt = false,
    'justinmk/vim-sneak',
    config = function()
      cmd[[
      map f <Plug>Sneak_s
      map F <Plug>Sneak_S
      ]]
    end,
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
    event = 'CursorMoved'
  },


  -- Fantastic fuzzy finder --
  {
    'nvim-telescope/telescope.nvim',
    config = get_config('telescope'),
    event = 'CursorMoved',
    cmd = {
      'Telescope',
    },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    module = 'telescope',
  },

  ----- Versioning -----

  -- Git integration

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

  -- Status markers in gutter
  {
    'lewis6991/gitsigns.nvim',
    config = get_config('gitsigns'),
    event = 'CursorMoved',
  },

  -- Auto-close brackets, parens, etc
  {
    -- 'Raimondi/delimitMate', --  kinda janky
    -- 'cohama/lexima.vim', -- super janky
    'jiangmiao/auto-pairs', -- still janky, but less so
  },

  -- Split/Join oneline/multiline statements
  {
    'AndrewRadev/splitjoin.vim',
    event = 'CursorMoved',
  },

  ----- Languages and syntax -----
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'CursorMoved',
  },

  {
    'wren/jrnl.vim',
    event = 'CursorMoved',
    ft = jrnl_filetypes,
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
    keys = {
      '<localleader>f',
    },
    cmd = 'Neoformat',
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
  {
    'editorconfig/editorconfig-vim',
  },

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
    config = get_config('nvim-lspconfig'),
    ft = lsp_filetypes,
    cmd = 'LspStart',
  },

  {
    'williamboman/nvim-lsp-installer',
    config = get_config('lsp-installer'),
    ft = lsp_filetypes,
    module = 'lspconfig',
  },

  {
    -- lua-based auto-completion for lsp
    -- might not need this
    disable = true,
    'nvim-lua/completion-nvim',
    config = get_config('completion-nvim'),
  },

  {
    'folke/lsp-trouble.nvim',
    config = get_config('lsp-trouble'),
    module = 'lspconfig',
  },

  {
    'tami5/lspsaga.nvim',
    config = get_config('lspsaga'),
    ft = lsp_filetypes,
  },

  {
    disable = true,
    'onsails/lspkind-nvim', -- lsp icons
  },

  -- @todo set this up
  -- DAP (Debug Adapter Protocol)
  {
    disable = true,
    'mfussenegger/nvim-dap',
    config = get_config('dap'),
    requires = {
      'nvim-treesitter/nvim-treesitter',
    }
  },

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
    keys = {
      '<c-m-j>',
      '<c-m-k>',
      '<c-n>',
    },
  },

  -- Highlights custom words on the fly independent of search
  {
    'lfv89/vim-interestingwords',
    config = get_config('interestingwords'),
    keys = {
      '<leader>*',
      '<leader><c-L>',
      '<leader>n',
      '<leader>N',
    },
  },

  ---- Productivity -----

  -- Toggle markdown checkboxes
  {
    'jkramer/vim-checkbox',
    config = get_config('checkbox'),
    ft = jrnl_filetypes
  },

  -- Automagically format markdown tables as you type
  {
    'dhruvasagar/vim-table-mode',
    ft = jrnl_filetypes
  },

  ----- Writing -----
  {
    'iamcco/markdown-preview.nvim',
    -- run = fn['mkdp#util#install'],
    run = 'cd app && yarn install',
    config = get_config('markdown-preview'),
    ft = jrnl_filetypes
  },


  {
    -- this sounds nice, but had lots of stability problems
    -- maybe we don't need this anymore?
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
