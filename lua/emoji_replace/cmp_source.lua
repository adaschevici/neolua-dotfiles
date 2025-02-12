local M = {}

local emoji_map = require("emoji_replace.emoji_map")

M.complete = function(_, _, callback)
	callback({ items = emoji_map, isIncomplete = true })
end

return M
