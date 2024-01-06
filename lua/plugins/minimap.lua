vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_width = 12

return {
    {
        "wfxr/minimap.vim",
        config = function()
            -- change the highlight color
            vim.cmd([[
            hi mr guibg=#2e3440 guifg=#ffffff guibg=#2e3440 guifg=#ffffff
            hi mcl guibg=#3b4252 guifg=#ffffff guibg=#3b4252 guifg=#ffffff
            ]])
            vim.g.minimap_highlight_range = "mr"
            vim.g.minimap_cursor_color = "mcl"
            -- prevent the cursor from entering the minimap
            vim.api.nvim_create_autocmd("WinEnter", {
                pattern = "*",
                callback = function()
                    if vim.fn.bufwinnr("-MINIMAP-") == -1 then
                        return
                    end
                    if vim.fn.winnr() == vim.fn.bufwinnr("-MINIMAP-") then
                        vim.api.nvim_command("wincmd t")
                    end
                end
            })
        end
    }
}
