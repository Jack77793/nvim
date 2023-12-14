return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            require'cmp'.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end
                },
                window = {
                    -- completion = require'cmp'.config.window.bordered(),
                    -- documentation = require'cmp'.config.window.bordered(),
                },
                mapping = require'cmp'.mapping.preset.insert({
                    ['<C-b>'] = require'cmp'.mapping.scroll_docs(-4),
                    ['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
                    ['<None>'] = require'cmp'.mapping.complete(),
                    ['<C-e>'] = require'cmp'.mapping.abort(),
                    ['<CR>'] = require'cmp'.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<C-k>'] = require'cmp'.mapping.select_prev_item(),
                    ['<C-j>'] = require'cmp'.mapping.select_next_item()
                }),
                sources = require'cmp'.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }
                }, {
                    { name = 'buffer' }
                })
            })

            -- Set configuration for specific filetype.
            require'cmp'.setup.filetype('gitcommit', {
                sources = require'cmp'.config.sources({
                    { name = 'cmp_git' } -- You can specify the `cmp_git` source if you were installed it.
                }, {
                    { name = 'buffer' }
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            require'cmp'.setup.cmdline({ '/', '?' }, {
                mapping = require'cmp'.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            require'cmp'.setup.cmdline(':', {
                mapping = require'cmp'.mapping.preset.cmdline(),
                sources = require'cmp'.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            require('lspconfig')['clangd'].setup {
                capabilities = capabilities
            }

            require('lspconfig')['pyright'].setup {
                capabilities = capabilities
            }
        end
    }
}
