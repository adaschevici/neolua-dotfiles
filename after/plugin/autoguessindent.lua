function AutoGuessIndent()
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*",
    command = "if exists(':GuessIndent') | execute 'GuessIndent' | endif"
  })

end

AutoGuessIndent()
