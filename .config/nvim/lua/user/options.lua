local opt = vim.opt


opt.expandtab = true --censé etendre les tabulations jusqu'au point mais ne marche visiblement pas
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.hlsearch = true 
opt.ignorecase = true
vim.opt.showtabline = 2
vim.opt.undofile = true
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.cursorline = true
opt.wrap = false -- si true affiche une ligne trop longue sur plusieurs lignes
opt.number = true;
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set ww+=lh]]



-- if nvimtree is active we dont want netrw
vim.g.loaded_netwr = 1
vim.g.reloaded_netwrPlugin = 1
