local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.servers = {
  "lua_ls",
  "typst_lsp",
  "marksman",
  "gopls",
  "pylsp",
  "rust_analyzer",
  "tsserver",
  "volar",
  "grammarly"
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }
  require("mason-lspconfig").setup {
    ensure_installed = M.servers,
    automatic_installation = true
  }
end

return M
