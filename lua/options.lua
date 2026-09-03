-- General options for vim
-- Specific clipboard build for WSL (shut up err from win32yank)
vim.g.clipboard = vim.fn.has("wsl") == 1 and {
  name = "wsl-native",
  copy = { ["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf" },
  paste = { ["+"] = "win32yank.exe -o --lf", ["*"] = "win32yank.exe -o --lf" },
} or nil
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
-- LSP options
vim.o.updatetime = 250  -- default is usually 4000 (4s)
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Executin non-vim commands (Allow config.nu)
vim.opt.shellcmdflag = "--login --stdin --no-newline -c"
-- Set leader key
vim.g.mapleader = ' '
