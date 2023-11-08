local status_ok, _ = pcall(require, "telescope")
if status_ok then
    vim.keymap.set('n', '<leader>ff', ":Telescope find_files<cr>", {desc="find files Telescope"})
    vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<cr>", {desc="live grep telescope"})   
end
