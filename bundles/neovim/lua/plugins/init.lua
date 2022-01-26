-- Change some builtin plugins active status --
lvim.builtin.project.active = false
lvim.builtin.terminal.active = true

-- Additional config for builtin plugins
require 'plugins.barbar'
require 'plugins.dashboard'
require 'plugins.gitsigns'
require 'plugins.lualine'
require 'plugins.nvim-tree'
require 'plugins.telescope'
require 'plugins.treesitter'
require 'plugins.dap'

-- Add our own plugins

-- Visual --
require 'plugins.colorizer'
require 'plugins.neoscroll'
require 'plugins.nightfox'
require 'plugins.easyalign'
-- require 'plugins.visual-multi'
require 'plugins.interestingwords'

-- Navigation --
require 'plugins.bqf' -- "better quick fix"
require 'plugins.hop'
require 'plugins.numb'
require 'plugins.sandwich'
require 'plugins.tmux-navigator'
require 'plugins.wordmotion'
require 'plugins.mundo'

-- Improve native --
require 'plugins.auto-session'
require 'plugins.bufferize'
-- require 'plugins.spectre' -- @todo add some keymappings
require 'plugins.vim-slash'
require 'plugins.accelerated-jk'
require 'plugins.repeat'
require 'plugins.mini'

-- Git --
require 'plugins.diffview'
require 'plugins.gitlinker'
require 'plugins.octo'

-- Coding --
require 'plugins.splitjoin'
require 'plugins.symbols-outline'
require 'plugins.indentline'
require 'plugins.editorconfig'

-- Writing --
require 'plugins.jrnl'
require 'plugins.bullets'
require 'plugins.truezen'
require 'plugins.pencil'
require 'plugins.markdown-preview'
