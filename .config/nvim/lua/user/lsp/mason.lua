local servers = {
    "lua_ls",
    "pyright",
    "clangd",
}

local settings = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

local diagnostic_config = { --defini la manière dont s'affiche les messages d'erreurs
    -- disable virtual text
    virtual_text = true,
    -- show signs
    --[[ signs = {
        active = signs,
    }, ]]
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "■",
    },
}


require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local function cpp_keymaps()
    vim.keymap.set("n", "<leader>arbre", "iusing el = int;<CR><CR>struct noeud{<CR>el val;<CR>noeud * sag;<CR>noeud * sad;<CR>};<CR><CR>using arbre = noeud *;", {buffer=0, desc="create tree struct"})

    vim.keymap.set("n", "<leader>at", "ivoid affiche_tableau(std::array<,> tab){<CR>std::cout<<\"[\";<CR>for(int i = 0; i < tab.size()-1; i++){std::cout<<tab[i]<<\", \";}<CR>std::cout<<tab[tab.size()-1]<<\"]\"<<std::endl;}<esc><UP><UP><UP>bbbli", {buffer=0, desc="afficher un tableau"})

    vim.keymap.set("n", "#", "i#include <iostream><CR><CR>int main(){<CR><CR><CR>return 0;<CR>};<up><up><up><tab>",
        { buffer = 0 })
    vim.keymap.set("n", "<leader>co", "istd::cout << << std::endl;<esc>4bi", { buffer = 0, desc = "write cout quickly" })
    vim.keymap.set("n", "<leader>st", "istruct {<cr><cr><BS>};<esc><up><up>$i", {
        buffer = 0,
        desc =
        "create empty struct"
    })
    local test = function ()
        vim.cmd("write")
        require('toggleterm').exec("g++ "..vim.fn.expand("%") .. " -o " .. vim.fn.expand("%:r") .. ".out && ./" .. vim.fn.expand("%:r") .. ".out")
    end
    vim.keymap.set("n", "<leader>gp", test, {buffer=0, desc="compile and run"})
    -- vim.keymap.set("n", "<leader>gp", "<cmd>w<CR><C-p>run '%:r'", {buffer=0, silent=true, desc="compile and run program"})
    --[[ vim.keymap.set("n", "<leader>gp", "<cmd>w<CR><cmd>!g++ '%' -o '%:r'.out <cr><cmd>!./'%:r'.out<CR>",
        { buffer = 0, silent = true, desc = "compile and run program" }) ]]

    --[[ vim.keymap.set("n", "<leader>g", "<cmd>w<CR><cmd>!g++ '%' -o '%:r'.out <CR>",
        { buffer = 0, silent = true, desc = "compile program" }) ]]
end

local function my_on_attach(client, buffnr)
    -- selon le server lsp
    if client.name == "clangd" then
        cpp_keymaps()
    end

    -- setup de l'affichage des diagnostiques
    vim.diagnostic.config(diagnostic_config)


    -- affichage des icones en fonction du type de diagnostique
    local signs = { Error = "", Warn = " ", Hint = " ", Info = "" }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end


for _, server in pairs(servers) do
    lspconfig[server].setup { -- on setup chaque serveur qui est dans la liste server (donc préinstallé)
        on_attach = my_on_attach
    }
end


lspconfig.pyright.setup {
    on_attach = my_on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoImportCompletions = false,
                diagnosticSeverityOverrides = {
                    reportOptionalMemberAccess = "none",
                },
            }
        }
    }
}
lspconfig.lua_ls.setup {
    on_attach = my_on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                }
            }
        }
    }
}
