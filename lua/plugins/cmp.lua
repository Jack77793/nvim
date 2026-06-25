return {
	plugins = {
		{ src = "https://github.com/hrsh7th/nvim-cmp" },
		{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
		{ src = "https://github.com/hrsh7th/cmp-nvim-lua" },
		{ src = "https://github.com/hrsh7th/cmp-buffer" },
		{ src = "https://github.com/hrsh7th/cmp-path" },
		{ src = "https://github.com/hrsh7th/cmp-cmdline" },
		{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
		{ src = "https://github.com/onsails/lspkind.nvim" },
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<None>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 240 },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "treesitter" },
				{ name = "buffer" },
			}),
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
			},
			formatting = {
				fields = { "icon", "abbr", "menu", "kind" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
					})(entry, vim_item)
					kind.icon = " " .. (kind.icon or "") .. "  "
					kind.kind = " (" .. (kind.kind or "") .. ") "
					return kind
				end,
			},
		})
		cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
