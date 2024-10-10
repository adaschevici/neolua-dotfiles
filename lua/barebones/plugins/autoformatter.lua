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
                exe = "pnpm exec prettier",
                args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote", "--bracket-spacing"},
                stdin = true
              }
            end
          },
          rust = {
          -- Rustfmt
            function()
              return {
                exe = "rustfmt", -- Ensure rustfmt is available in your PATH or specify the path
                args = {"--emit=stdout"},
                stdin = true
              }
            end
          },
          go = {
            -- Gofmt
            function()
              return {
                exe = "gofmt", -- Ensure gofmt is available in your PATH or specify the path
                stdin = true
              }
            end
          },
          -- More filetypes...
        }
      })
    end
  }
