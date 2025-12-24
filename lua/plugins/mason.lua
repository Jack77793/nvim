return {
    {
        "mason-org/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = {{ "mason-org/mason.nvim", opts = {} }},
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = true,
                ensure_installed = {
                    "bashls",
                    "clangd",
                    "ltex_plus",
                    "lua_ls",
                    "pyright"
                }
            })
        end
    }
}
