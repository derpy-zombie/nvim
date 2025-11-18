-- Install with npm install -g pyright
return {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(
            bufnr, 
            { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' }
        )
        if root then
            on_dir(root)
        else
            on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
        end
    end
}
