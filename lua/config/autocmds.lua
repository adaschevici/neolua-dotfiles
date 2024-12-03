vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		require("vim.treesitter.query").set("lua", "folds", [[(function_definition (block) @fold)]])
	end,
	group = vim.api.nvim_create_augroup("LazyVimFolds", { clear = true }),
	desc = "Treesitter folding only Lua functions",
})
