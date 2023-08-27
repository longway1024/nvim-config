return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            vim.cmd[[colorscheme tokyonight-storm]]
            require('lualine').setup({
                options = {
                    theme = 'tokyonight'
                },
            })
            require('barbecue').setup {
                theme = 'tokyonight',
            }
        end
    },
    {
        "navarasu/onedark.nvim",
        config = function ()
            -- vim.cmd[[colorscheme onedark]]
            require('onedark').setup {
                style = 'warm',
                transparent = false,
                term_colors = true,
                ending_tildes = false,
                cmp_itemkind_resverse = false,
                toggle_style_key = nil,
                toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    string = 'none',
                    varuables = 'none'
                },
            }
            -- require('lualine').setup({
            --     options = {
            --         theme = 'onedark'
            --     },
            -- })
            -- require('barbecue').setup {
            --     theme = 'onedark',
            -- }
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function ()
            -- vim.cmd[[colorscheme gruvbox]]
            require('gruvbox').setup({
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    flods = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_intend_guides = false,
                inverse = true,
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        --     require('lualine').setup({
        --         options = {
        --             theme = 'gruvbox'
        --         },
        --     })
        --     require('barbecue').setup {
        --         theme = 'gruvbox',
        --     }
        end
    }
}
