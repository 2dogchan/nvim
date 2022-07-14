require("utils.global")
-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 自动命令
require("autocmds")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.treesitter")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.toggleterm")
require("plugin-config.comment")
require("plugin-config.fidget")

vim.cmd("source ~/.config/nvim/lua/plugin-config/coc.vim")


-- utils
-- 复制到windows剪贴板
require("utils.fix-yank")
