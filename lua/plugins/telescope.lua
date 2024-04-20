return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" }
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    }
  end,
  keys = {
    -- disable the keymap to grep files
    {"<leader>/", false},
    -- change a keymap
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find LSP Symbols" },
    { "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Find LSP Workspace Symbols" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Find LSP References" },
    { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Find LSP Definitions" },
    { "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Find LSP Implementations" },
    { "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Find Treesitter" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
    { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Find Marks" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Old Files" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Find Quickfix" },
    { "<leader>fl", "<cmd>Telescope loclist<cr>", desc = "Find Location List" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word" },
    { "<leader>fy", "<cmd>Telescope filetypes<cr>", desc = "Find File Types" },
    { "<leader>fv", "<cmd>Telescope vim_options<cr>", desc = "Find Vim Options" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find Keymaps" },
    { "<leader>fn", "<cmd>Telescope neoclip<cr>", desc = "Find Neoclip" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
  },
}
