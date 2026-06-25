return {
	plugins = { "https://github.com/lukas-reineke/indent-blankline.nvim" },
	config = function()
		require("ibl").setup({
			indent = { char = "|" },
			scope = { enabled = false },
		})
	end,
}
