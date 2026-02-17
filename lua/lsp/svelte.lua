
return {
    cmd = { 'svelteserver', '--stdio' },
    filetypes = { 'svelte' },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, {
            'svelte.config.js',
            'svelte.config.cjs',
            'svelte.config.mjs',
            'package.json'
        })
        if root then
            on_dir(root)
        else
            on_dir(vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
        end
    end,
}
