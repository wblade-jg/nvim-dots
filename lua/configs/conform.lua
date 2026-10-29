local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    python = { "ruff_format" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
}

return options
