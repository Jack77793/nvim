local opts = { noremap = true, silent = true }
-- nvim
vim.keymap.set("n", "sv", "<Cmd>vsp<CR>", opts)
vim.keymap.set("n", "sb", "<Cmd>sp<CR>", opts)
vim.keymap.set("n", "sc", "<C-w>c", opts)
vim.keymap.set("n", "so", "<C-w>o", opts)
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)
-- toggleterm
vim.keymap.set("n", "tt", "<Cmd>ToggleTerm direction=float<CR>", opts)
-- hop
vim.keymap.set("n", "fj", "<Cmd>HopWord<CR>", opts)
-- barbar
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
vim.keymap.set("n", "<A-q>", "<Cmd>BufferClose<CR>", opts)
vim.keymap.set("n", "<A-b>", "<Cmd>BufferPick<CR>", opts)
-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "fh", telescope.help_tags, { desc = "Telescope help tags" })

-- incremental selection treesitter/lsp
vim.keymap.set({ "n", "x", "o" }, "<CR>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<BS>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

-- conform
vim.keymap.set({ "n", "v" }, "=", function()
	if #require("conform").list_formatters(0) > 0 then
		return "gq"
	end
	return "="
end, { expr = true, desc = "Format with conform or fallback to treesitter indent" })

vim.keymap.set("n", "==", function()
	if #require("conform").list_formatters(0) > 0 then
		return "gqq"
	end
	return "=="
end, { expr = true, desc = "Format line with conform or fallback to treesitter indent" })

-- lsp
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local buffer = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buffer)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, buffer)
		vim.keymap.set("n", "gk", vim.lsp.buf.hover, buffer)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buffer)
		vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, buffer)
		-- vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, buffer)
		-- vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, buffer)
		-- vim.keymap.set("n", "gwl", function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, buffer)
		-- vim.keymap.set("n", "gDD", vim.lsp.buf.type_definition, buffer)
		vim.keymap.set("n", "gR", vim.lsp.buf.rename, buffer)
		-- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, buffer)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, buffer)
		-- vim.keymap.set("n", "gf", function()
		--     vim.lsp.buf.format { async = true }
		-- end, buffer)
	end,
})
