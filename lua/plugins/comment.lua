return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function ()
            require("Comment").setup({
                padding = true,
                sticky = true,
                ignore = nil,
                opleader = {
                    line = "gl",
                    block = "gb"
                }
            })
        end
    }
}
