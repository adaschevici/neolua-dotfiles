return {
    'mhartington/formatter.nvim',
    config = function()
      require('formatter').setup({
        filetype = {
          python = {
            -- Use black for Python
            function()
              return {
                exe = "black",
                args = {"--quiet", "-"},
                stdin = true
              }
            end
          },
          javascript = {
            -- Use prettier for JavaScript
            function()
              return {
                exe = "prettier",
                args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                stdin = true
              }
            end
          },
          -- Add more filetypes here
        }
      })
    end
  }
