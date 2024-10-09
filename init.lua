-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.

-- Enable line numbers
-- vim.opt.number = true

-- Enable relative line numbers
-- vim.opt.relativenumber = true

vim.api.nvim_command("cnoreabbrev W w")
vim.api.nvim_command("cnoreabbrev Q q")
vim.api.nvim_command("cnoreabbrev Qa qa")
vim.api.nvim_command("cnoreabbrev WQ wq")
vim.api.nvim_command("cnoreabbrev wQ wq")
vim.api.nvim_command("cnoreabbrev WQ wq")
vim.api.nvim_command("cnoreabbrev Wq wq")
vim.api.nvim_command("cnoreabbrev WQ wq")
vim.api.nvim_command("cnoreabbrev wQ wq")
vim.api.nvim_command("cnoreabbrev WQ wq")
vim.api.nvim_command("cnoreabbrev WQa wqa")
vim.api.nvim_command("cnoreabbrev Wqa wqa")
vim.api.nvim_command("cnoreabbrev WQA wqa")
vim.api.nvim_command("cnoreabbrev WA wa")
vim.api.nvim_command("cnoreabbrev Wa wa")
vim.api.nvim_command("cnoreabbrev wA wa")

vim.g.mapleader = " "
vim.opt.clipboard:append("unnamedplus")

-- Auto-command in Lua

vim.api.nvim_create_autocmd({ "BufRead" }, {
	pattern = "*",
	command = "set relativenumber",
})

local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
	vim.fn.getchar()
	vim.cmd.quit()
end

local group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.py", "*.js", "*.mjs", "*.ts", "*.css", "*.html", "*.rs", "*.go" },
	command = "FormatWrite",
	group = group,
})

local spellcheck_group = vim.api.nvim_create_augroup("SpellCheckMarkdown", { clear = true })

-- Create an autocommand to enable spellcheck for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us" -- You can set your preferred language here
	end,
	group = spellcheck_group,
})

require("init")

-- local function is_large_file(bufnr)
-- 	local file_size_mb = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) / 1024 / 1024
-- 	return file_size_mb > 0.5
-- end
--
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		if is_large_file(args.buf) then
-- 			vim.cmd([[
--         syntax off
--         setlocal foldmethod=manual
--         TSDisable highlight
--         LSPDisable  -- Disable Language Server Protocol features
--         setlocal nocursorline nocursorcolumn -- Disable extras that might cause slowdowns
--         setlocal spell spelllang=en_us -- Keep spellcheck but simplify
--       ]])
-- 		end
-- 	end,
-- })
-- vim.api.nvim_set_keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { noremap = true, silent = true })
