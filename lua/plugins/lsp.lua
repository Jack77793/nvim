return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            require("lspconfig").pyright.setup({})
            require("lspconfig").clangd.setup({})
            require("lspconfig").lua_ls.setup({})
        end
    }
}
