-- Install with npm install -g @vue/language-server
return {
    cmd = { 'vue-language-server', '--stdio'},
    filetypes = { 'vue' },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {'package.json', 'tsconfig.json', '.git'})
        if root then
            on_dir(root)
        else
            on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
        end
    end
}
