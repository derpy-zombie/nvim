return {
  "hrsh7th/nvim-cmp",
  dependencies = { "L3MON4D3/LuaSnip" },
  opts = function(_, opts)
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    opts.sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' }
    }

    opts.snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    }

    opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          local entry = cmp.get_selected_entry()
          if not entry then
            cmp.select_next_item()
          else
            cmp.confirm()
          end
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
