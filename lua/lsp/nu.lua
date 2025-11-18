-- Default installed with nu.
return {
  cmd = { 'nu', '--lsp' },
  filetypes = { 'nushell' },
  root_dir = function(fname) return vim.loop.cwd() end,
}
