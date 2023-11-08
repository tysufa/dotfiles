vim.opt.termguicolors=true

-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme dracula")
vim.g.theme_id = 2
-- end themery block



-- pour savoir quel nombre correspond a quelle couleur executer 256-color-table.sh
vim.api.nvim_set_hl(0, 'DiagnosticWarn',{fg="#9ba112"}) -- affiche les messages de warning en jaune
vim.api.nvim_set_hl(0, 'DiagnosticFLoatingWarn',{fg="#9ba112"}) -- change la couleur du text dans les warnings
vim.api.nvim_set_hl(0, 'DiagnosticError',{fg="#bf1313"}) -- affiche les messages d'erreurs en rouge
vim.api.nvim_set_hl(0, 'DiagnosticFloatingError',{fg="#d14008"}) -- change la couleur du texte dans les boites de dialogues d'erreur
vim.api.nvim_set_hl(0, 'DiagnosticUnderLineError',{fg="#FF0000"}) -- change la couleur du texte dans les boites de dialogues d'erreur
