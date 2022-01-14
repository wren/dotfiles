-- smooth scrolling
local plugin = { 'karb94/neoscroll.nvim' }

local my_keys = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' }

plugin.keys = my_keys
plugin.config = function()
  require('neoscroll').setup({
    mappings = my_keys,             -- Replace these native key mappings
    hide_cursor = true,             -- Hide cursor while scrolling
    stop_eof = false,               -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false,    -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,      -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true,    -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = 'quadratic',  -- Default easing function
    pre_hook = nil,                 -- Function to run before the scrolling animation starts
    post_hook = nil,                -- Function to run after the scrolling animation ends
  })
end

table.insert(lvim.plugins, plugin)
