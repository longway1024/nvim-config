return {
    {
        "folke/persistence.nvim",
        config = true,
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        opts = {
            enable_check_bracket_line = false,
        },
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "folke/flash.nvim",
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Flash Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
        config = true
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle [N]eo-Tree", mode = { "n", "v" } }
        },
        config = true,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            local wk = require("which-key")
            wk.register({
                f = {name = "file"},
                l = {name = "lsp"},
            },
            { prefix = "<leader>" })
        end,
    },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        config = true,
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        config = true,
    },
    {
        "voldikss/vim-floaterm",
        cmd = "FloatermNew",
        keys = {
            { "<leader>t", "<cmd>FloatermNew --height=0.8 --width=0.8<CR>", desc = "[T]erminal", mode = {"n", "v"}},
            { "<leader>g", "<cmd>FloatermNew --height=0.9 --width=0.9 lazygit<CR>", desc = "Lazy[G]it", mode = {"n", "v"}},
        },
        config = function ()
            require('illuminate').configure()
        end
    },
    {
        "Eandrju/cellular-automaton.nvim",
        keys = {
            { "<leader>r", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "[R]ain", mode = {"n"}},
        },
    },
    {
        "ntpeters/vim-better-whitespace",
    },
    {
        "chxuan/cpp-mode",
        vim.keymap.set({"n", "v"}, "<leader>a", [[<cmd>Switch<CR>]], { desc = 'Switch h/cpp'})
    },
    {
        "vim-scripts/Mark--KarKat",
    }
}
