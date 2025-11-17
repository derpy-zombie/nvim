return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = vim.lsp.config

        -- Scan directory.
        local lsp_dir = vim.fn.stdpath('config') .. '/lua/lsp'
        -- Required for async I/O operations
        local uv = vim.loop

        -- Get the server name
        -- Should be the name of the file. Else transform it here.
        local function get_servername(filename)
            local name = filename:gsub('%.lua$', '')
            -- Transformations if needed here.
            return name
        end

        -- Get the files
        local handle = uv.fs_scandir(lsp_dir)
        if handle then
            while true do
                local name = uv.fs_scandir_next(handle)
                if not name then break end
                if name:match('%.lua$') then
                    local server = get_servername(name)
                    local mod_name = 'lsp.' .. server
                    local ok, config = pcall(require, mod_name)
                    if ok and type(config) == 'table' then
                        if lspconfig[server] then
                            vim.lsp.config(server, config)
                            vim.lsp.enable(server)
                        else
                            vim.notify('LSP server not found for' .. server, vim.log.levels.error)
                        end
                    else
                        vim.notify('Failed to load config from ' .. mod_name, vim.log.levels.error)
                    end
                end
            end
        else
            vim.notify('Cannot scan lsp dir ' .. lsp_dir, vim.log.levels.error)
        end
    end
}
