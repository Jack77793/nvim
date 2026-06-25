return {
	plugins = { "https://github.com/nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"cpp",
			"css",
			"html",
			"ini",
			"json",
			"latex",
			"lua",
			"make",
			"markdown",
			"nix",
			"python",
			"rust",
			"toml",
			"vim",
			"xml",
			"yaml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"bash",
				"c",
				"cpp",
				"css",
				"html",
				"ini",
				"json",
				"jsonc",
				"latex",
				"lua",
				"make",
				"markdown",
				"nix",
				"python",
				"rust",
				"toml",
				"vim",
				"xml",
				"yaml",
			},
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		vim.wo.foldlevel = 99
	end,
}
