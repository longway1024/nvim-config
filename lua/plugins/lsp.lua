return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        "nvimdev/lspsaga.nvim",

    },
    config = function()
        -- set diagnostic icons
        local signs = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
        }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
        end
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            bashls = {},
            clangd = {},
        }
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
            nmap('gd', "<cmd>Lspsaga peek_definition<CR>", '[G]oto [D]efinition')
            nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('gi', "<cmd>Lspsaga finder imp<CR>", '[G]oto [I]mplementation')
            -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>lr', "<cmd>Lspsaga rename ++project<CR>", '[R]ename')
            nmap('<leader>la', "<cmd>Lspsaga code_action<CR>", 'Code [A]ction')
            nmap('<leader>ld', require "telescope.builtin".diagnostics, '[D]iagnostics')
            nmap('gr', "<cmd>Lspsaga finder ref+imp<CR>", '[G]oto [R]eferences')
            -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end
        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        require("lspsaga").setup({
            vim.diagnostic.config({
                virtual_text = false,
                underline = false,
            }),
            definition = {
                keys = {
                    edit = { "<CR>" },
                    quit = { "q", "Q", "<ESC>" },
                    vsplit = { "sj" },
                    split = { "sl" },
                }
            },
            finder = {
                max_height = 0.6,
                keys = {
                    toggle_or_open = { "<CR>" },
                    quit = { "q", "Q", "<ESC>" },
                    vsplit = { "sj" },
                    split = { "sl" },
                }
            },
            rename = {
                keys = {
                    quit = { "<ESC>" },
                }
            },
            diagnostic = {
                diagnostic_only_current = true,
            },
        })
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "√",
                    package_pending = "",
                    package_uninstalled = "×"
                },
            },
        })
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    {
                        on_attach = on_attach,
                        capabilities = capabilities
                    },
                    config
                )
            )
        end
    end
}
