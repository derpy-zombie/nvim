return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
    init_options = {
        plugins = {
            name = '@vue/typescript-plugin',
            localtion = os.getenv('HOME') .. '/.local/share/fnm/node-versions/v22.21.1/installation/lib/node_modules',
            languages = { 'vue' }
        }
    },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { 'package.json', 'tsconfig.json', '.git' })
        if root then
            on_dir(root)
        else
            on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
        end
    end
}
