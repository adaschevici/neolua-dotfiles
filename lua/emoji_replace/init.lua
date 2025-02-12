local M = {}

-- Store loaded emoji map
M.emoji_map = require("emoji_replace.emoji_map")

-- Function to replace emoji shortcuts
function M.replace_emoji()
	local line = vim.api.nvim_get_current_line()
	for shortcode, emoji in pairs(M.emoji_map) do
		line = line:gsub(vim.pesc(shortcode), emoji)
	end
	vim.api.nvim_set_current_line(line)
end

-- Command and autocommand
vim.api.nvim_create_user_command("ReplaceEmojis", M.replace_emoji, {})
vim.api.nvim_create_autocmd("InsertLeave", { pattern = "*", callback = M.replace_emoji })

return M
