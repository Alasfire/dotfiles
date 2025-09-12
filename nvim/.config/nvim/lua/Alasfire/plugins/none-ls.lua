return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.luacheck,
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}),
         -- Formatter: clang-format
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "--style=file" }, -- respects .clang-format file
        }),
      }
    })
  end,
}
