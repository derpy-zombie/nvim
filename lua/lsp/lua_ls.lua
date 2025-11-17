return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', 'luarc.jsonc', '.git'},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJit',
                path = { 'lua/?.lua', 'lua/?/init.lua' }
            },
            diagnostics = {
                globals = { 'vim', 'vim.uv' }
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.env.VIMRUNTIME .. '/lua',
                    vim.fn.stdpath('config'),
                    vim.api.nvim_get_runtime_file('', true)
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}
