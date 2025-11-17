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
                globals = { 'vim' }
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.stdpath('config')
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}
