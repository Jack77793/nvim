return {
	plugins = { "https://github.com/AlexvZyl/nordic.nvim" },
	config_ahead = function()
		require("nordic").setup({
			bold_keywords = true,
			transparent = { bg = false, float = false },
			bright_border = true,
			reduced_blue = false,
			swap_backgrounds = false,
			telescope = { style = "flat" },
		})
		require("nordic").load()
	end,
}
