function SetKeyMappings()
  vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'vws', '<cmd>lua vim.lsp.buf.workspace_symbol(\'⌘\')<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'vrn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnotics.goto_next()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnotics.goto_prev()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'frr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
end

SetKeyMappings()
