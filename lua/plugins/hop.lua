return {
	plugins = {
		{ src = "https://github.com/smoka7/hop.nvim", version = vim.version.range("*") },
	},
	config = function()
		require("hop").setup({
			jump_on_sole_occurrence = false,
		})
	end,
}
