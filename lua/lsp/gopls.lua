return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotemplate' },
    --root_dir = function(fname) return vim.loop.cwd() end,
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { 'go.work', 'go.mod', '.git' })
        if root then
            on_dir(root)
        else
            on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
        end
    end
}
