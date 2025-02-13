local M = {}

-- Store loaded emoji map
M.emoji_map = require("emoji_replace.emoji_map")

-- Function to replace emoji shortcuts
function M.replace_emoji()
	local line = vim.api.nvim_get_current_line()
	for shortcode, emoji in pairs(M.emoji_map) do
		line = line:gsub(":" .. shortcode .. "(:?)", emoji .. "%1")
	end
	vim.api.nvim_set_current_line(line)
end

-- Function for native Neovim completion
function M.emoji_complete(findstart, base)
	if findstart == 1 then
		local line = vim.api.nvim_get_current_line()
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local start = line:sub(1, col):match(".*():[^:]*$") -- Find start of emoji shortcode
		return start or -1
	else
		local matches = {}
		local base_lc = base:lower() -- Convert input to lowercase for fuzzy search

		for shortcode, emoji in pairs(M.emoji_map) do
			if shortcode:lower():find(base_lc, 2, true) then -- Fuzzy match
				table.insert(matches, { word = shortcode, abbr = emoji .. " " .. shortcode })
			end
		end

		return matches
	end
end

-- Set Neovim's built-in `completefunc` to use emoji completion
vim.opt.completefunc = "v:lua.require'emoji_replace'.emoji_complete"

vim.api.nvim_set_keymap("i", ":", ":<C-X><C-U>", { noremap = true, silent = true })

-- Command and autocommand
vim.api.nvim_create_user_command("ReplaceEmojis", M.replace_emoji, {})
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", callback = M.replace_emoji })

return M
