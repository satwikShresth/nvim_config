require "user.launch"
require "user.options"
require "user.keymaps"
spec "user.colorscheme"
spec "user.treesitter"
spec "user.mason"
spec "user.lspconfig"
spec "user.extras.diffview"
spec "user.navic"
spec "user.breadcrumbs"
spec "user.illuminate"
spec "user.fzf_lua"
spec "user.undotree"
spec "user.notify"
-- spec "user.typst_preview"
-- spec "user.typst"
spec "user.lexima"
spec "user.neogen"
spec "user.oil"
spec "user.todo"
-- spec "user.distant"
-- spec "user.harpoon"
spec "user.indentline"
spec "user.nvimtree"
spec "user.lualine"
spec "user.whichkey"
spec "user.cmp"
spec "user.comment"
spec "user.gitsigns"
spec "user.neogit"
-- spec "user.neotree"
-- extras
spec "user.extras.colorizer"
require "user.lazy"
vim.cmd("source ~/.vimrc")
