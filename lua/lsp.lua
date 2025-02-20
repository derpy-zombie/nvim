require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
	 -- Check available lsp's at https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer', 'ts_ls', 'cssls', 'cssmodules_ls', 'eslint', 'svelte', 'tailwindcss', 'bashls' },
})
