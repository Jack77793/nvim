vim.g.ZFVimIM_keymap = 0

return {
    {
        "ZSaberLv0/ZFVimIM",
        dependencies = {
            "ZSaberLv0/ZFVimJob",
            "ZSaberLv0/ZFVimGitUtil",
            { url = "git@github.com:Jack77793/zfvimim-pinyin-base.git" }
        },
        config = function ()
            vim.cmd([[
            let g:zf_git_user_email = "jack77793@hotmail.com""
            let g:zf_git_user_name = "Jack77793"
            let g:zf_git_user_token = "0"
            let g:ZFVimIM_cloudAsync_autoCleanup = 30
            let g:ZFVimIM_symbolMap = {
            \   ' ' : [''],
            \   '`' : ['·'],
            \   '!' : ['！'],
            \   '$' : ['￥'],
            \   '^' : ['……'],
            \   '-' : [''],
            \   '_' : ['——'],
            \   '(' : ['（'],
            \   ')' : ['）'],
            \   '[' : ['【'],
            \   ']' : ['】'],
            \   '<' : ['《'],
            \   '>' : ['》'],
            \   '\' : ['、'],
            \   '/' : ['、'],
            \   ';' : ['；'],
            \   ':' : ['：'],
            \   ',' : ['，'],
            \   '.' : ['。'],
            \   '?' : ['？'],
            \   "'" : ['‘', '’'],
            \   '"' : ['“', '”'],
            \   '0' : [''],
            \   '1' : [''],
            \   '2' : [''],
            \   '3' : [''],
            \   '4' : [''],
            \   '5' : [''],
            \   '6' : [''],
            \   '7' : [''],
            \   '8' : [''],
            \   '9' : [''],
            \ }
            inoremap <expr><silent> \\ ZFVimIME_keymap_toggle_i()
            ]])
        end
    }
}
