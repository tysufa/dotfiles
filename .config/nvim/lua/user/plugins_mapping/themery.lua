local status_ok, _ = pcall(require, "themery")

if status_ok then
    vim.keymap.set("n", "<leader>cs", "<cmd>Themery<cr>", {desc="change colorscheme"})
end
