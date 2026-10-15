-- This file is to configure lsp

-- Show a icon if something is wrong with the line.
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

-- Show diagnosis when the cursor is at the affected line.
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

-- Keymap to trigger documentation from the LSP
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {clear = true}),
    callback = function(event)
        local opts = { buffer = event.buf, silent = true, desc = 'Hover Documentation'}
        -- Press 'K' to show info/docs in floating window.
        vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({
                border = 'rounded',
                max_width = 80,
            })
        end, opts)
    end,
})
