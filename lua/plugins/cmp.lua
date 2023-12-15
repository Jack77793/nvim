return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("cmp").setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end
                },
                mapping = require"cmp".mapping.preset.insert({
                    ["<C-b>"] = require"cmp".mapping.scroll_docs(-4),
                    ["<C-f>"] = require"cmp".mapping.scroll_docs(4),
                    ["<None>"] = require"cmp".mapping.complete(),
                    ["<C-e>"] = require"cmp".mapping.abort(),
                    ["<CR>"] = require"cmp".mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-k>"] = require"cmp".mapping.select_prev_item(),
                    ["<C-j>"] = require"cmp".mapping.select_next_item()
                }),
                sources = require"cmp".config.sources({
                    { name = "nvim_lsp", max_item_count = 240 },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "treesitter" },
                    { name = "buffer" }
                })
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            require("lspconfig")["clangd"].setup({
                capabilities = capabilities
            })

            require("lspconfig")["lua_ls"].setup({
                capabilities = capabilities
            })

            require("lspconfig")["pyright"].setup({
                capabilities = capabilities
            })
        end
    }
}
