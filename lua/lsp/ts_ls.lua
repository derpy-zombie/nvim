return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
    root_dir = function(fname) return vim.loop.cwd() end,
}
