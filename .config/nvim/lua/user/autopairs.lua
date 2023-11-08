local autopairs = require("nvim-autopairs")


-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')


autopairs.setup{
    fast_wrap = {
        map = "<C-e>",
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        before_key = 'h',
        after_key = 'l',
        cursor_pos_before = true,
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        manual_position = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
    enable_check_bracket_line = true, -- si on a ) alors taper ( donnera () et pas (()
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
}


