return {
	plugins = {
		{ src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("*") },
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
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

		require("telescope").load_extension("fzf")
	end,
	hook = function()
		vim.api.nvim_create_autocmd("PackChanged", {
			callback = function(ev)
				local name, kind, path = ev.data.spec.name, ev.data.kind, ev.data.path
				if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
					vim.system({ "make" }, { cwd = path }):wait()
				end
			end,
		})
	end,
}
