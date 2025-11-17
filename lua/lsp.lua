# This file is to configure lsp

vim.diagnostic.config({
    virtual_text = true, --Show inline warn/err
    signs = true --Symbols in gutter
    underline = true -- Underline problem
    severity_sort = true -- Sort by severity
    float = {
        border = 'rounded',
        source = 'always' -- Where the errors come from
    }
})
