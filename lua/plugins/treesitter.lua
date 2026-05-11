return {
  "nvim-treesitter/nvim-treesitter",
  -- Note: main is now the default, so you usually don't need 'branch' 
  -- but it doesn't hurt to be explicit if you want the rewrite.
  branch = "main", 
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- On the 'main' branch, you can often just use the top-level setup
    require("nvim-treesitter").setup({
      highlight = {
        enable = true,
        -- If you still want to disable specific things:
        disable = function(lang, buf)
          -- This check is safer for the new API
          return vim.tbl_contains({"markdown", "markdown_inline", "bash", "go"}, lang)
        end,
      },
      indent = { enable = true },
      -- 'ensure_installed' still works, but ensure you are on Nvim 0.10+
      ensure_installed = { "lua", "vim", "bash", "go", "typescript" },
    })
  end,
}
