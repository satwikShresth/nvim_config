local M = {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons","junegunn/fzf", build = "./install --bin" },
}

function M.config()
  require("fzf-lua").setup({
  desc = "fzf-native run inside a tmux popup",
  fzf_bin = "fzf-tmux",
  fzf_opts = { ["--border"] = "rounded" },
  fzf_tmux_opts = { ["-p"] = "80%,90%" },
  winopts = { preview = { default = "bat", layout = "horizontal" } },
  manpages = { previewer = "man_native" },
  helptags = { previewer = "help_native" },
  lsp = { code_actions = { previewer = "codeaction_native" } },
  tags = { previewer = "bat" },
  btags = { previewer = "bat" },
  defaults = {
    git_icons = false,
    file_icons = false,
  },
})
end

return M
