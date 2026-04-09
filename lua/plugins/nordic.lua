return {
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nordic").setup({
                bold_keywords = true,
                transparent = {
                    bg = false,
                    float = false
                },
                bright_border = true,
                reduced_blue = false,
                swap_backgrounds = false,
                telescope = {
                    style = "flat"
                }
            })
            require("nordic").load()
        end
    }
}
