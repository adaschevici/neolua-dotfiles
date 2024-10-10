return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',  -- Automatically install and update language parsers
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = "all",  -- Automatically install all maintained parsers
      highlight = { enable = true },  -- Enable tree-sitter-based highlighting
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = { enable = true }  -- Enable tree-sitter-based indentation
    }
  end
}
