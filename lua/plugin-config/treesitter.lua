_G.usePlugin("nvim-treesitter.configs", function(fidget)
	fidget.setup({
		-- 安装 language parser
		ensure_installed = { "go", "json", "markdown", "lua" },
		-- 启用代码高亮模块
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		-- 启用增量选择模块
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				node_decremental = "<BS>",
				scope_incremental = "<TAB>",
			},
		},
		-- 启用代码缩进模块 (=)
		indent = {
			enable = true,
		},
	})
end)
