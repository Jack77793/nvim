return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            require("mason").setup()
        end
    }
}
