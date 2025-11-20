-- Keymap configuration.
-- define common options
local opts = {
	noremap = true,
	silent = true
}

-------------------------------
-- Normal mode ----------------
-------------------------------
-- Window navigation.
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
-- Tree (nvim-tree)
vim.keymap.set('n', '<C-b>', ':NvimTreeFocus<cr>', opts)
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ts', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
