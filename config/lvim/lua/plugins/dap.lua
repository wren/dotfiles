-- Debugging module for various languages
-- Individual language plugins installed below

lvim.builtin.dap.active = true

-- Python --
local plugin = { 'mfussenegger/nvim-dap-python' }

plugin.config = function()
  require('dap-python').setup(PYTHON_VENV .. '/python')
end

table.insert(lvim.plugins, plugin)
