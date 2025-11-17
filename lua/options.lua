-- General options for vim
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.mouse = "a" -- Allow use of mouse
-- Tab options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- UI config
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- 
vim.o.updatetime = 250  -- default is usually 4000 (4s)
