return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            vim.g.barbar_auto_setup = false
            require("barbar").setup({
                tabpages = true,
                icons = {
                    buffer_index = true,
                    diagnostics = {
                        [ vim.diagnostic.severity.ERROR ] = { enabled = true },
                        [ vim.diagnostic.severity.WARN ] = { enabled = false },
                        [ vim.diagnostic.severity.INFO ] = { enabled = false },
                        [ vim.diagnostic.severity.HINT ] = { enabled = true },
                    },
                    gitsigns = {
                        added = {enabled = true, icon = '+'},
                        changed = {enabled = true, icon = '~'},
                        deleted = {enabled = true, icon = '-'}
                    },
                    modified = {button = '●'},
                    pinned = { button = '', filename = true},
                }
            })
        end
    }
}
