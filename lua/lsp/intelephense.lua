-- Install with npm i -g intelephense
return {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { 'composer.json', '.git' })
        if root then
            on_dir(root)
        else
            on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
        end
    end,
}
