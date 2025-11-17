return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotemplate' },
    root_dir = function(fname) return vim.loop.cwd() end,
}
