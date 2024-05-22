local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
}

function M.config()
  local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
    vim.keymap.del("n", "<C-k>", { buffer = bufnr })
    vim.keymap.set("n", "<S-k>", api.node.open.preview, opts "Open Preview")
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  end
  -- local HEIGHT_RATIO = 0.8 -- You can change this
  -- local WIDTH_RATIO = 0.5  -- You can change this too

  local icons = require "user.icons"

  require("nvim-tree").setup {
    on_attach = my_on_attach,
    sync_root_with_cwd = true,
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = false,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        glyphs = {
          default = icons.ui.Text,
          symlink = icons.ui.FileSymlink,
          bookmark = icons.ui.BookMark,
          folder = {
            arrow_closed = icons.ui.ChevronRight,
            arrow_open = icons.ui.ChevronShortDown,
            default = icons.ui.Folder,
            open = icons.ui.FolderOpen,
            empty = icons.ui.EmptyFolder,
            empty_open = icons.ui.EmptyFolderOpen,
            symlink = icons.ui.FolderSymlink,
            symlink_open = icons.ui.FolderOpen,
          },
          git = {
            unstaged = icons.git.FileUnstaged,
            staged = icons.git.FileStaged,
            unmerged = icons.git.FileUnmerged,
            renamed = icons.git.FileRenamed,
            untracked = icons.git.FileUntracked,
            deleted = icons.git.FileDeleted,
            ignored = icons.git.FileIgnored,
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    update_focused_file = {
      enable = true,
      debounce_delay = 15,
      update_root = true,
      ignore_list = {},
    },

    diagnostics = {
      enable = true,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      icons = {
        hint = icons.diagnostics.BoldHint,
        info = icons.diagnostics.BoldInformation,
        warning = icons.diagnostics.BoldWarning,
        error = icons.diagnostics.BoldError,
      },
    },
    -- view = {
    --     relativenumber = true,
    --     float = {
    --       enable = true,
    --       open_win_config = function()
    --         local screen_w = vim.opt.columns:get()
    --         local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    --         local window_w = screen_w * width_ratio
    --         local window_h = screen_h * height_ratio
    --         local window_w_int = math.floor(window_w)
    --         local window_h_int = math.floor(window_h)
    --         local center_x = (screen_w - window_w) / 2
    --         local center_y = ((vim.opt.lines:get() - window_h) / 2)
    --                          - vim.opt.cmdheight:get()
    --         return {
    --           border = "rounded",
    --           relative = "editor",
    --           row = center_y,
    --           col = center_x,
    --           width = window_w_int,
    --           height = window_h_int,
    --         }
    --         end,
    --     },
    --     width = function()
    --       return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    --     end,
    --   },
  }
end

return M
