require("lazy").setup({
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	-- import any extras modules here
	{ import = "lazyvim.plugins.extras.ai.copilot" },
	{ import = "lazyvim.plugins.extras.ai.copilot-chat" },
	{ import = "lazyvim.plugins.extras.dap.core" },
	{ import = "lazyvim.plugins.extras.editor.aerial" },
	{ import = "lazyvim.plugins.extras.editor.harpoon2" },
	{ import = "lazyvim.plugins.extras.editor.navic" },
	{ import = "lazyvim.plugins.extras.editor.telescope" },
	{ import = "lazyvim.plugins.extras.formatting.prettier" },
	{ import = "lazyvim.plugins.extras.lang.astro" },
	{ import = "lazyvim.plugins.extras.lang.docker" },
	{ import = "lazyvim.plugins.extras.lang.go" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.markdown" },
	{ import = "lazyvim.plugins.extras.lang.prisma" },
	{ import = "lazyvim.plugins.extras.lang.python" },
	{ import = "lazyvim.plugins.extras.lang.tailwind" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.yaml" },
	{ import = "lazyvim.plugins.extras.linting.eslint" },
	{ import = "lazyvim.plugins.extras.test.core" },
	{ import = "lazyvim.plugins.extras.ui.treesitter-context" },
	{ import = "lazyvim.plugins.extras.util.dot" },
	{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
	{ import = "lazyvim.plugins.extras.vscode" },
	{ import = "plugins" },
} --[[@as LazySpec]], {
	-- Configure any other `lazy.nvim` configuration options here
	install = { colorscheme = { "cyberdream" } },
	ui = { backdrop = 100 },
	performance = {
		rtp = {
			-- disable some rtp plugins, add more to your liking
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
			},
		},
	},
} --[[@as LazyConfig]])
