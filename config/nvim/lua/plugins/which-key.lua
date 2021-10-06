local which_key = require("which-key")
which_key.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = " ", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true -- show help message on the command line when the popup is visible
}

local ignore = "which_key_ignore"
-- Keybindings help text
-- @todo add more help text for keybindings
which_key.register({
  ["<leader>!"] = ignore,
  ["<leader>["] = ignore,
  ["<leader><space>"] = ignore,
  ["<leader>"] = {
    w = { "Write file" },
    q = { "Quit window/tab/split" },
    ["<C-L>"] = ignore,
    ["*"] = { "Highlight <word>" },
    h = {
      name = '+History',
        l = { "Git Blame" },
        c = { "Commands" },
        f = { "Files" },
        ['/']= { "Search" },
    },
    f = {
      name = "+Find",
      b = { "Buffers" },
      c = { "Commands" },
      f = { "Find (in cwd)" },
      m = { "Maps" },
      p = { "Files in Project"},
      s = { "Color schemes" },
      t = { "Filetypes" },
      w = { "Find <word> (in cwd)" },
    },
  },
  ["<localleader>"] = {
    name = "local leader",
    t = { "Toggle checkbox" },
    ["<space>"] = "Delete trailing spaces",
    s = "Show styling group"
  }
})

-- @todo Old plugin (delete when happy with new plugin)
-- -- Keymap --
-- opts = { silent = true }
-- map('n', '<leader>',  ':<c-u>WhichKey "<space>"<CR>', opts)
-- map('n', '<localleader>', ':<c-u>WhichKey  ";"<cr>', opts)
-- map('n', '[',             ':<c-u>WhichKey  "["<cr>', opts)
-- map('n', ']',             ':<c-u>WhichKey  "]"<cr>', opts)
--
-- -- Init --
-- vim.call('which_key#register', '<Space>', 'g:which_key_leader')
-- vim.call('which_key#register', ';', 'g:which_key_localleader')
-- vim.call('which_key#register', '[', 'g:which_key_prev')
-- vim.call('which_key#register', ']', 'g:which_key_next')
--
-- -- Settings --
-- g.which_key_use_floating_win = 0
--
-- -- Events --
-- nvim_create_augroup('which_key', {
--   string.format(
--     '%s | %s',
--     'FileType which_key set laststatus=0 noshowmode noruler',
--     'autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler'
--   )
-- })
--
-- g.which_key_leader = {
--   name = '+Root ' ,
--   b = {
--     name = 'buffer +',
--     c = 'keep current buffer',
--     o = 'kill {numbers or name} buffer',
--   },
--   e = {
--     name = '+explorer',
--     f = 'find current file' ,
--     o = 'open' ,
--   },
--   ['-'] = 'choose window by {prompt char}' ,
--   f = {
--     name = '+search {files cursorword word outline}',
--     b = 'find buffers',
--     f = 'find in project',
--     c = 'find commands',
--     p = 'find files in project',
--     m = 'find mappings',
--     w = 'find {word} in project',
--     v = 'find in vista outline',
--     h = {
--       name = '+history',
--       f    = 'file history',
--       c    = 'command history',
--       s    = 'search history',
--     },
--   },
--   l = 'clear search highlights' ,
--   m = 'open mundotree' ,
--   w = 'write file',
--   p = 'edit pluginsconfig {filename}',
--   g = {
--     name = ' git +',
--     d    = 'Gdiff',
--     c    = 'Gcommit',
--     b    = 'Gblame',
--     B    = 'Gbrowse',
--     S    = 'Gstatus',
--     p    = 'git push',
--     l    = 'GitLogAll',
--     h    = 'GitBranch',
--   },
--   t = {
--     name = '+tab-operate',
--     n    = 'new tab',
--     e    = 'edit tab',
--     m    = 'move tab',
--   },
--   q = 'quit window',
--   ['/'] = 'comment/uncomment line',
--   [' '] = {
--     name = '+easymotion-jumpto-word ' ,
--     b = {'<plug>(easymotion-b)' , 'beginning of word backward'},
--     f = {'<plug>(easymotion-f)' , 'find {char} to the left'},
--     w = {'<plug>(easymotion-w)' , 'beginning of word forward'},
--   }
-- }
--
-- g.which_key_localleader ={
--   name  = '+LocalLeaderKey'  ,
--   t     = 'toggle markdown checkbox',
--   s     = 'show theme classes on cursor word',
--   [' '] = 'clear trailing whitespace',
-- }
--
-- g.which_key_next = {
--   name  = '+Next',
--   a     = 'ale nextwarp',
--   c     = 'next change',
--   b     = 'next buffer',
--   t     = 'next tab',
--   [']'] = 'jump prefunction-golang',
-- }
--
-- g.which_key_prev = {
--   name  = '+Previous',
--   a     = 'ale prewarp',
--   c     = 'previous change',
--   b     = 'pre buffer',
--   t     = 'previous tab',
--   ['['] = 'jump nextfunction-golang',
-- }
--
