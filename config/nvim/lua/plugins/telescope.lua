-- Config --
require('telescope').setup{
  defaults = {
    layout_strategy = 'flex',
    layout_config = {
      flex = {
        flip_columns = 200,
      },
      horizontal = {
        -- prompt_position = 'top',
      }
    },

    file_ignore_patterns = {
      "node_modules",
      "^.git/",
      "/Alfred.alfredpreferences/",
    },

    mappings = {
      -- mode = { ["key"] = "action" }
      i = {
        ["<C-k>"] = "which_key"
      }
    }
  },
  pickers = {
    -- picker_name = { picker_config_key = value }
    find_files = {
      hidden = true
    }

  },
  extensions = {
    -- extension_name = { extension_config_key = value }
  }
}

-- Keymap --
local silent = { silent = true }
map('n', '<leader>fb', ':Telescope buffers<CR>', silent)
map('n', '<leader>ft', ':Telescope filetypes<R>', silent)
map('n', '<M-C-p>', ':Telescope buffers<CR>', silent)
map('n', '<C-p>', ':Telescope git_files<CR>', silent)
map('n', '<leader>fp', ':Telescope find_files<CR>')
map('n', '<leader>ff', ':Telescope live_grep<CR>')
map('n', '<leader>fm', ':Telescope keymaps<CR>')
map('n', '<leader>fk', ':Telescope help_tags<CR>')
map('n', '<leader>fc', ':Telescope commands<CR>')
map('n', '<leader>hc', ':Telescope cocmmand_history<CR>')
map('n', '<leader>hs', ':Telescope search_history<CR>')
map('n', '<leader>hf', ':Telescope oldfiles<CR>')
map('n', '<leader>fs', ':Telescope colorscheme<CR>', silent)
map('n',  '<leader>fw', ':Telescope grep_string<CR>', silent)
map('n',  'z=', ':Telescope spell_suggest theme=cursor<CR>', silent)

