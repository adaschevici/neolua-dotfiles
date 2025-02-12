-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

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

-- vim.api.nvim_create_autocmd({ "BufRead" }, {
-- 	pattern = "*",
-- 	command = "set relativenumber",
-- })
--
local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)
-- -- In your ~/.config/nvim/init.lua
--
-- local emoji_data = {}
-- local file = io.open(vim.fn.stdpath("config") .. "/emoji.json", "r") -- Path to your emoji.json
-- if file then
-- 	local content = file:read("*a")
-- 	emoji_data = vim.fn.json_decode(content)
-- 	file:close()
-- else
-- 	print("Error: Could not open emoji.json file.")
-- 	return {} -- Return empty table if file not found
-- end
--
-- local function emoji_complete(arglead, cmdtype, startcol, completion)
-- 	local matches = {}
-- 	for _, entry in ipairs(emoji_data) do
-- 		if string.sub(entry.shortcode, 1, #arglead) == arglead then
-- 			table.insert(matches, entry.shortcode .. "\t" .. entry.emoji) -- Add emoji to display
-- 		end
-- 	end
-- 	return matches
-- end
--
-- vim.api.nvim_create_autocmd("InsertCharPre", {
-- 	pattern = ":", -- Trigger completion after typing ":"
-- 	callback = function()
-- 		vim.fn.complete("", "customlist,menuone", emoji_complete)
-- 	end,
-- })
--
-- -- Optional: Key mapping for manual completion
-- vim.api.nvim_set_keymap(
-- 	"i",
-- 	"<C-e>",
-- 	"<Cmd>lua vim.fn.complete('', 'customlist,menuone', emoji_complete)<CR>",
-- 	{ noremap = true, silent = true }
-- )

require("lazy_setup")
