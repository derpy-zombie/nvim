return {
    cmd = { 'zls' },
    filetypes = { 'zig' },
    root_dir = function(fname) return vim.loop.cwd() end,
}
