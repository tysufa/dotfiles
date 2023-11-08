local status_ok, dap = pcall(require, "dap")

if status_ok then
    vim.keymap.set('n', '<F1>', function() dap.continue() end)
    vim.keymap.set('n', '<F2>', function() dap.step_over() end)
    vim.keymap.set('n', '<F3>', function() dap.step_into() end)
    vim.keymap.set('n', '<F4>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
end


