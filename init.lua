-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.

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

vim.api.nvim_command("colorscheme habamax")
vim.g.mapleader = ' '

local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
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

colorscheme = habamax
require "lazy_setup"
