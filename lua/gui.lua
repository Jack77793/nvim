vim.o.guifont = "SarasaTermSC Nerd Font:h15"
vim.g.neovide_floating_shadow = true
vim.g.neovide_transparency = 0.9
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_no_idle = false
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"

local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
end

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("ime_input", { clear = true }),
    pattern = "*",
    callback = set_ime
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = vim.api.nvim_create_augroup("ime_input", { clear = true }),
    pattern = "[/\\?]",
    callback = set_ime
})

vim.cmd [[ TransparentDisable ]]
