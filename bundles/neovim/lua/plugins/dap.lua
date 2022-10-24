-- Debugging module for various languages
-- Individual language plugins installed below
lvim.builtin.dap.active = true

-- Python --
local plugin = { 'mfussenegger/nvim-dap-python' }

plugin.config = function()
  local dap = require('dap-python')
  dap.setup(PYTHON_VENV .. '/python')
  dap.test_runner = 'pytest'
end

table.insert(lvim.plugins, plugin)
