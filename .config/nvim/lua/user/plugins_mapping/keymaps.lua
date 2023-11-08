local keymap = vim.api.nvim_set_keymap

local opts = {}

vim.g.mapleader = ' '

vim.g.maplocalleader = " "


-- Normal --
keymap("n", "<leader>o", ":set formatoptions-=o<CR>ojj:set formatoptions+=o<CR>i", {desc="go to next line without indents"})
keymap("n", "//", ":%s/\\<\\>/<Left><Left><Left>", {desc="search and replace"}) -- permet de chercher et remplacer tous les termes exact entre \<\>
keymap("n", "<leader>n", ":set number!<CR>", {desc="toggle line numbers"})
keymap("n", ">", ">>", opts)                             --permet d'indenter directement plutôt que d'appuyer 2 fois
keymap("n", "<", "<<", opts)                             --permet d'indenter directement plutôt que d'appuyer 2 fois


keymap("n", "<leader>fd", ":lua vim.lsp.buf.format()<cr>", {desc="lsp formatting"})

--navigate windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<S-tab>", ":bprevious<CR>", opts)
keymap("n", "<C-x>", ":bdelete<CR>", opts)

-- Insert --
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)
keymap("i", "<C-o>", "<esc>o", opts)


-- Press jk fast to enter
keymap("i", "jj", "<ESC>", {desc="exit insert mode"})


require("plugins_mapping/nvimtree") -- nvim tree keympas
require("plugins_mapping/telescope")
require("plugins_mapping/nvimdap")
require("plugins_mapping/toggleterm")
require("plugins_mapping/themery")
require("plugins_mapping/lsp")
