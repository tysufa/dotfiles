require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require("mason").setup()
require("mason-nvim-dap").setup({
    ensure_installed = {"python", "codelldb"},
    handlers = {},
})


-- ouvrir dapui automatiquement
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["test"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["test"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["test"] = function()
  dapui.close()
end
