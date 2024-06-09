local M = {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "folke/neodev.nvim"
  }
}
function M.config()
  require("neodev").setup({
    library = {
      plugins = { "nvim-dap-ui" },
      types = true 
    },
  })

  require("dapui").setup()
end


return M
