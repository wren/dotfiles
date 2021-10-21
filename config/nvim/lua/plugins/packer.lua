
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
    opt = false,
    'hoob3rt/lualine.nvim',
    config = get_config('lualine'),
  },

  ----- Session/view management -----
  {
    'rmagatti/auto-session',
    config = get_config('auto-session'),
    event = 'BufEnter',
    keys = {
      '<leader>ss',
      '<leader>sr',
      '<leader>sd',
    },
  },

  ----- Search -----
  -- Better search with
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
    event = 'BufEnter',
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
    event = {
      'WinEnter',
      'BufEnter',
      'WinLeave',
    },
  },

  ----- Tab management -----

  {
    -- replaces bufferline and bufkill
    'romgrk/barbar.nvim',
    config = get_config('barbar'),
    event = {
      'BufEnter',
      'CursorMoved',
      'BufAdd',
      'BufWinEnter',
    }
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
    'easymotion/vim-easymotion',
    config = get_config('easymotion'),
    event = 'BufEnter',
  },

  {
    'chaoren/vim-wordmotion',
    config = get_config('wordmotion'),
    event = 'CursorMoved'
  },

  -- Navigate windows in vim and tmux with the same keys
  {
    opt = false,
    'christoomey/vim-tmux-navigator',
    config = get_config('tmux-navigator'),
  },

  -- Fantastic fuzzy finder
  {
    'junegunn/fzf.vim',
    config = get_config('fzf'),
    requires = {
      'junegunn/fzf',
      run = fn['fzf#install'],
    },
    cmd = {
      'Files',
      'GFiles',
      'GFiles?',
      'Buffers',
      'Colors',
      'Ag',
      'Rg',
      'Lines',
      'BLines',
      'Tags',
      'BTags',
      'Marks',
      'Windows',
      'Locate',
      'History',
      'History:',
      'History/',
      'Snippets',
      'Commits',
      'BCommits',
      'Commands',
      'Maps',
      'Helptags',
      'Filetypes',
    },
    keys = {
      '<c-p>',
      '<leader>f',
    },
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
    opt = false,
    'nvim-lua/plenary.nvim',
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'BufWinEnter',
    config = get_config('gitsigns'),
  },

  -- Auto-close brackets, parens, etc
  {
    -- 'Raimondi/delimitMate', --  kinda janky
    -- 'cohama/lexima.vim', -- super janky
    'jiangmiao/auto-pairs', -- still janky, but less so
  },

  -- Split/Join oneline/multiline statements
  {
    opt = false,
    'AndrewRadev/splitjoin.vim',
  },

  ----- Languages and syntax -----
  {
    opt = false,
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },

  {
    opt = false,
    'wren/jrnl.vim',
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
    opt = false,
    'neovim/nvim-lspconfig',
    run = 'npm install -g typescript-language-server',
    config = get_config('nvim-lspconfig'),
  },

  {
    'williamboman/nvim-lsp-installer',
    config = get_config('lsp-installer'),
    ft = lsp_filetypes,
    cmd = {
      'LspInfo',
      'LspInstall',
      'LspInstallInfo',
      'LspInstallLog ',
    },
    requires = {
      'neovim/nvim-lspconfig',
    }
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
    ft = lsp_filetypes,
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
    disable = false,
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
  -- {
  --   'mfussenegger/nvim-dap',
  --   config = get_config('dap'),
  --   requires = {
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
