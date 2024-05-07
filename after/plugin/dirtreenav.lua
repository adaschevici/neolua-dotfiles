function setupDirtreeNav()
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",  -- This applies the autocmd to all files and directories
    callback = function()
      local path = vim.fn.expand('%:p')  -- Get the full path of the current file or directory
      if vim.fn.isdirectory(path) == 1 then
        -- Close the buffer that attempted to open the directory
        vim.api.nvim_buf_delete(0, {force = true})

        -- Open neo-tree focused on that directory
        require("neo-tree").show({
          reveal_path = path,
          window = {
            position = "current",
          }
        })
      end
    end
  })
end

setupDirtreeNav()
