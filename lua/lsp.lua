# This file is to configure lsp

vim.diagnostic.config({
    virtual_text = false,
    --virtual_text =  {
    --    prefix = '●', -- can be '■', '▎', '●', etc.
    --    spacing = 4,
    --}, --Show inline warn/err
    signs = true, --Symbols in gutter
    underline = true, -- Underline problem
    severity_sort = true, -- Sort by severity
    float = {
        border = 'rounded',
        source = true
    }
})

vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        if mode == 'n' then
            vim.diagnostic.open_float(
                nil,
                {
                    border = 'rounded',
                    focusable = false,
                    --prefix = '●'
                }
            )
        end
    end
})

