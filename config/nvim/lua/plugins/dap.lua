require('dap-python').setup('~/.cache/pyenv/versions/neovim3/bin/python')
require('dap-python').test_runner = 'pytest'
local dap = require('dap')


-- dap.adapters.python = {
--   type = 'executable',
--   command = '/Users/jonathan/.cache/pyenv/versions/neovim3/bin/python',
--   args = { '-m', 'debugpy.adapter' };
-- }
-- dap.configurations.python = {
--   {
--     -- These first three options are required by nvim-dap
--     type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch',
--     name = "Launch file",
-- 
--     -- see: https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
--     program = "${file}",
--     pythonPath = function()
--       local cwd = fn.getcwd()
--       local python = os.getenv('VIRTUAL_ENV')
--       if python == nil then
--         local f = assert(io.popen('which python', 'r'))
--         python = assert(f:read('*a'))
--         f:close()
--       else
--         python = python .. '/bin/python'
--       end
--       print('python: ', python)
--       return python
--     end,
--   },
-- }
-- 
