return {
  {
    "github/copilot.vim",
    -- cmd = "Copilot",
    -- event = "InsertEnter",
    opt = true,
    config = function()
      vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
        pattern = "*",
        callback = function()
          vim.cmd("Copilot enable")
        end
      })
    end
  }
}

