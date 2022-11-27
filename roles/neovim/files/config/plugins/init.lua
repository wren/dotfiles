-- Change some builtin plugins active status --
lvim.builtin.project.active = false
lvim.builtin.terminal.active = true

-- Additional config for builtin lunar plugins
require 'plugins.bufferline'
require 'plugins.dashboard'
require 'plugins.gitsigns'
require 'plugins.lualine'
require 'plugins.nvim-tree'
require 'plugins.telescope'
require 'plugins.treesitter'
require 'plugins.dap'
require 'plugins.which-key'

-- Add our own plugins

-- Visual --
require 'plugins.colorizer'
require 'plugins.neoscroll'
require 'plugins.onedark'
require 'plugins.easyalign'
-- require 'plugins.visual-multi'
require 'plugins.interestingwords'

-- Navigation --
require 'plugins.bqf' -- "better quick fix"
require 'plugins.hop'
require 'plugins.numb'
require 'plugins.sandwich'
require 'plugins.wordmotion'
require 'plugins.mundo'

-- Improve native --
require 'plugins.auto-session'
require 'plugins.bufferize'
-- require 'plugins.spectre' -- @todo add some keymappings
require 'plugins.vim-slash'
require 'plugins.accelerated-jk'
require 'plugins.repeat'
require 'plugins.splits'
require 'plugins.mini'
require 'plugins.lastplace'
require 'plugins.suda'

-- Git --
require 'plugins.diffview'
require 'plugins.gitlinker'
require 'plugins.octo'
require 'plugins.committia'

-- Coding --
require 'plugins.splitjoin'
require 'plugins.symbols-outline'
require 'plugins.indentline'
require 'plugins.editorconfig'
require 'plugins.null-ls'

-- Writing --
require 'plugins.jrnl'
require 'plugins.bullets'
require 'plugins.truezen'
require 'plugins.pencil'
require 'plugins.markdown-preview'
