local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")

if lspconfig_status_ok then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 }) -- buffer=0 empêche d'appliquer les keymaps a un autre fichier qui n'est pas dans le même language
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "goto definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "list references" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0, desc = "goto type definition" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "goto implementation" })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0, desc = "goto next diagnostic" })
    vim.keymap.set("n", "<leader>db", vim.diagnostic.goto_prev, { buffer = 0, desc = "goto previous diagnostic" })
    vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { buffer = 0, desc = "open diagnostic" })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0, desc = "rename" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "code actions" })

end

