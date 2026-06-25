return {
	plugins = { "https://github.com/windwp/nvim-autopairs" },
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input", "lilypond" },
		})
	end,
}
