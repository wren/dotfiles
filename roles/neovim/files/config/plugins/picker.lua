return {
  "ibhagwan/fzf-lua",
  opts = {
    defaults = {
      hidden = true,
      header = false,
      preview_pager = "diff-so-fancy",
    },
  },
  keys = {
    { "<leader>sf", "<cmd>FzfLua filetypes<CR>", desc = "Filetypes" },
  },
}
