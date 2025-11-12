return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 30,
        side = 'left',
        auto_resize = true,
      },
      renderer = {
        group_empty = true,
      },
      git = {
        enable = true,
        ignore = false,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
  keys = {
    { '<leader>fe', function() vim.cmd([[NvimTreeToggle]]) end, desc = 'Toggle nvim-tree' },
    { '<leader>fE', function() vim.cmd([[NvimTreeFindFile]]) end, desc = 'Show current file in nvim-tree' },
  },
}
