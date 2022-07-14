-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("正在安装Pakcer.nvim，请稍后...")
	paccker_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		-- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
		install_path,
	})

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("没有安装 packer.nvim")
	return
end

packer.startup({
	function(use)
		-- Packer 可以升级自己
		use("wbthomason/packer.nvim")
		-------------------------- plugins -------------------------------------------
		-- coc.nvim
		use({ 'neoclide/coc.nvim', branch = 'release' })
		-- treesitter 语法高亮
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		--多光标
		use { 'mg979/vim-visual-multi', branch = 'master' }

		-- nvim-tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		-- bufferline
		use({
			"akinsho/bufferline.nvim",
			requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
		})
		-- lualine
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		-- telescope extensions
		use("LinArcX/telescope-env.nvim")
		use("nvim-telescope/telescope-ui-select.nvim")
		-- indent-blankline 左侧对齐线
		use("lukas-reineke/indent-blankline.nvim")
		--------------------- colorschemes --------------------
		use { "navarasu/onedark.nvim" }
		-------------------------------------------------------
		use({ "akinsho/toggleterm.nvim" })
		-- Comment
		use("numToStr/Comment.nvim")
		----------------------------------------------

		-- 右下角进度条
		use("j-hui/fidget.nvim")

		-- dlv
		use("sebdah/vim-delve")

		if paccker_bootstrap then
			packer.sync()
		end
	end,
	config = {
		-- 锁定插件版本在snapshots目录
		snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
		-- 这里锁定插件版本在v1，不会继续更新插件
		-- snapshot = "v1",

		-- 最大并发数
		jax_jobs = 16,
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		-- display = {
		-- 使用浮动窗口显示
		--   open_fn = function()
		--     return require("packer.util").float({ border = "single" })
		--   end,
		-- },
	},
})
