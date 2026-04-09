return {
    {
        "pteroctopus/faster.nvim",
        lazy = false,
        config = function()
            require("faster").setup({
                opts = {
                    behaviours = {
                        filesize = 1
                    }
                }
            })
        end
    }
}
