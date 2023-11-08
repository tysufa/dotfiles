local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end


-- execute automatiquement :PackerCompile dès que user.plugins est modifié et sauvegardé
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here

    -- colorschemes + theme switcher
    use "NLKNguyen/papercolor-theme"
    use 'Mofiqul/dracula.nvim'
    use "zaldih/themery.nvim"

    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- LSP
    use "neovim/nvim-lspconfig"               -- enable LSP
    use "williamboman/mason.nvim"             -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"   --help linking mason and lsp
    use {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    }

    use "nvim-treesitter/nvim-treesitter" -- améliore la coloration syntaxique

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use "windwp/nvim-autopairs"                                                                   -- auto parenthèses

    use "jose-elias-alvarez/null-ls.nvim"                                                         -- permet le formattage du code et des diagnostiques intégrant le formatage

    use "nvim-tree/nvim-tree.lua"                                                                 -- explorateur de fichier plus joli (remplace Sexplore)

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }        --permet l'affichage des différents buffer de façon propre

    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } } -- customize vim status line

    use { -- presentation pour nvim
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use "andrewferrier/debugprint.nvim" -- debugger inutile pour faire des prints plus efficaces

    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"

    -- wich-key (affichage des raccourcis claviers)
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use "akinsho/toggleterm.nvim"



    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
