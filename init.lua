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

vim.g.mapleader = ' '
vim.opt.clipboard:append("unnamedplus")

-- Auto-command in Lua

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = "*",
    command = "set relativenumber"
})

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

-- vim.api.nvim_exec([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePost *.py,*.js,*.mjs,*.ts,*.css,*.html,*.rs,*.go FormatWrite
--   augroup END
-- ]], true)

local group = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*.py", "*.js", "*.mjs", "*.ts", "*.css", "*.html", "*.rs", "*.go"},
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

-- Function to move to the next spelling error
_G.next_spell_error = function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(']s', true, true, true), 'n', true)
  -- vim.api.nvim_command(']s')
end

-- Function to move to the previous spelling error
_G.prev_spell_error = function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('[s', true, true, true), 'n', true)
  -- vim.api.nvim_command('[s')
end

-- Key mappings for navigating spelling errors
vim.api.nvim_set_keymap('n', '<leader>sn', ':lua next_spell_error()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', ':lua prev_spell_error()<CR>', { noremap = true, silent = true })

-- local function populate_spell_check_errors()
--   local qf_list = {}
--   local bufnr = vim.api.nvim_get_current_buf()
--   local line_count = vim.api.nvim_buf_line_count(bufnr)
--
--   for lnum = 1, line_count do
--     local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
--     local col = 0
--
--     while col < #line do
--       local start, end_col = vim.fn.spellbadword(line:sub(col + 1))
--       if start ~= "" then
--         table.insert(qf_list, {
--           bufnr = bufnr,
--           lnum = lnum,
--           col = col + 1,
--           text = 'Spelling error: ' .. line:sub(col + start, col + end_col - 1)
--         })
--         col = col + end_col
--       else
--         break
--       end
--     end
--   end
--
--   if next(qf_list) ~= nil then
--     vim.fn.setqflist(qf_list, 'r')
--   else
--     print("No spelling errors found")
--   end
-- end
-- local function populate_spell_check_errors()
--   local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--   local qf_list = {}
--
--   for lnum, line in ipairs(lines) do
--     for _, word in ipairs(vim.fn.split(line, '\\W\\+')) do
--       if vim.fn.spellbadword(word)[1] ~= '' then
--         table.insert(qf_list, {
--           bufnr = vim.api.nvim_get_current_buf(),
--           lnum = lnum,
--           col = vim.fn.match(line, '\\<' .. word .. '\\>') + 1,
--           text = 'Spelling error: ' .. word
--         })
--       end
--     end
--   end
--
--   vim.fn.setqflist(qf_list, 'r')
-- end
--
-- Function to open the quickfix list
-- local function open_quickfix()
--   vim.api.nvim_command('copen')
-- end
--
-- -- Populate quickfix list with spell check errors and open it
-- populate_spell_check_errors()
-- open_quickfix()

require "lazy_setup"
