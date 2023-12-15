return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "bash", "c", "cpp", "lua", "vim", "nix", "python", "html", "xml", "css", "yaml", "toml", "ini", "json", "markdown" },
                -- enable highlighting
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                -- enable incremental_selection
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                        scope_incremental = "<TAB>"
                    }
                },
                -- enable code formatting based on Treesitter (experimental feature)
                indent = {
                    enable = true
                }
            })
            -- enable folding
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
            -- don"t fold by default
            vim.wo.foldlevel = 99
        end
    }
}
