require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "rust_analyzer", "clangd", "pyright", "ts_ls" }
vim.lsp.enable(servers)

-- rust-analyzer: hints sin ruido y check rápido
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = { command = "check" }, -- check rápido al guardar (no clippy)
      inlayHints = {
        chainingHints = { enable = false }, -- apaga hints de cadenas de métodos
        closingBraceHints = { enable = false }, -- apaga hints de llaves de cierre
        -- typeHints y parameterHints quedan activos (los útiles)
      },
    },
  },
})

-- inlay hints: tipos visibles solo en el editor (como en Kiro)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
