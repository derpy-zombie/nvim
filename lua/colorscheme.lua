-- define your colorscheme here

local theme = os.getenv('THEME') == 'prefer-dark' and 'mocha' or 'latte'

require('catppuccin').setup({
    flavour = theme,
})

vim.cmd.colorscheme 'catppuccin'

