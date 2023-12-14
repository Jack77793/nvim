return {
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup({
                keys = {
                    ["'"] = {
                        escape = true,
                        close = true,
                        pair = "''",
                        disabled_filetypes = {
                            "lilypond",
                            "text"
                        }
                    }
                },
                options = {
                    disable_when_touch = true
                }
            })
        end
    }
}
