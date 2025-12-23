return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            vim.lsp.enable("bashls")
            vim.lsp.enable("clangd")
            vim.lsp.enable("ltex_plus")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("pyright")
        end
    }
}
