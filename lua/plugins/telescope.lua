return {
	plugins = {
		{ src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("*") },
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<C-h>"] = "which_key" },
				},
			},
			pickers = {
				keymaps = { theme = "dropdown" },
			},
		})
	end,
}
