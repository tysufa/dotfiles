local status_ok, _ = pcall(require, "nvim-tree")

local function close_buffer()
    local api = require("nvim-tree.api")
    if not api.tree.is_visible() then
        vim.cmd("bdelete")
    else
        vim.cmd("bdelete") -- on supprime le buffer actuel
        vim.cmd("bNext") -- on passe au suivant : on quitte le buffer nvim tree pour passer au buffer que l'on voulai réellement
    end
end

if status_ok then
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", {desc="Nvim tree focus"})
    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", {desc="toggle NvimTree"})
    vim.keymap.set("n", "<C-x>", ":NvimTreeClose<CR>:bdelete<CR>", {desc="Close Buffer"})
    vim.keymap.set("n", "<C-x>", close_buffer, {desc="Close Buffer"})
end
