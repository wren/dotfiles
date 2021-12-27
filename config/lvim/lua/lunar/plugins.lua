-- Disable some builtins --
lvim.builtin.project.active = false

-- Additional config for builtin plugins
lvim.autocommands.custom_groups = {
  { 'ColorScheme', 'nightfox', ':lua require "plugins.lualine"' }
}

-- Add some of our own plugins --
lvim.plugins = {
  {
    'EdenEast/nightfox.nvim',
    config = get_config('nightfox'),
  },

  {
    'RRethy/vim-hexokinase',
    run = 'make hexokinase',
    setup = get_config('hexokinase'),
    event = 'CursorMoved',
  },

  {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    config = get_config('neoscroll'),
  },

  {
    'chaoren/vim-wordmotion',
    config = get_config('wordmotion'),
  },

  {
    'christoomey/vim-tmux-navigator',
    config = get_config('tmux-navigator'),
    event = 'CursorMoved',
  },

  {
    'machakann/vim-sandwich',
    config = get_config('sandwich'),
    event = 'CursorMoved',
  },

  {
    opt = false,
    'wren/jrnl.vim',
  },

  {
    disable = true,
    'wfxr/minimap.vim',
    run = 'brew install code-minimap',
    config = function()
      g.minimap_width = 10
      g.minimap_auto_start = 1
      g.minimap_auto_start_win_enter = 1
      g.minimap_highlight_search = 1
    end,
    cmd = {
      'Minimap',
      'MinimapClose',
      'MinimapToggle',
      'MinimapRefresh',
      'MinimapUpdateHighlight',
    }
  },

  {
    'phaazon/hop.nvim',
    event = 'BufRead',
    config = function()
      require('hop').setup()
      vim.api.nvim_set_keymap('n', 'f', ':HopWord<cr>', { silent = true })
      vim.api.nvim_set_keymap('n', 'F', ':HopChar1<cr>', { silent = true })
    end,
  },

  {
    'nacro90/numb.nvim',
    event = 'BufRead',
    config = function()
      require('numb').setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  {
    -- find and replace
    -- @todo add some keymappings for this
    disable = true,
    'windwp/nvim-spectre',
    event = 'BufRead',
    config = function()
      require('spectre').setup()
      cmd [[nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>]]
    end,
  },

  {
    'sindrets/diffview.nvim',
    event = 'BufRead',
  },

  {
    -- better quickfix window
    'kevinhwang91/nvim-bqf',
    event = { 'BufRead', 'BufNew' },
    config = function()
      require('bqf').setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
        },
        func_map = {
          vsplit = '',
          ptogglemode = 'z,',
          stoggleup = '',
        },
        filter = {
          fzf = {
            action_for = { ['ctrl-s'] = 'split' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
          },
        },
      })
    end,
  },

  {
    -- generate links to code on github, bitbucket, etc
    'ruifm/gitlinker.nvim',
    keys = {
      '<leader>gy'
    },
    config = function()
      require('gitlinker').setup {
        opts = {
          mappings = '<leader>gy',
        },
      }
    end,
  },

  {
    -- manage github issues and PRs from editor
    'pwntester/octo.nvim',
    cmd = {
      'Octo',
      'OctoAddReviewComment',
      'OctoAddReviewSuggestion',
    },
  },

  -- Writing --
  {
    'Pocco81/TrueZen.nvim',
    config = get_config('truezen'),
    cmd = {
      'TZAtaraxis',
      'TZFocus',
      'TZMinimalist',
    },
  },

  {
    'preservim/vim-pencil',
    ft = {
      'jrnl',
    },
  },

  -- Misc Tools --
  {
    'AndrewRadev/bufferize.vim',
    cmd = {
      'Bufferize'
    }
  },
}
