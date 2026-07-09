return {
  "folke/noice.nvim",
  opts = {
    messages = {
      view = "mini",
    },
  },
  {
    -- overlay for jumping to places in the buffer (e.g. press "f")
    "smoka7/hop.nvim",
    event = "BufRead",
    keys = {
      { "f", "<cmd>HopWord<cr>", desc = "Hop Word" },
      { "F", "<cmd>HopChar1<cr>", desc = "Hop Character" },
    },
    config = true,
  },
}
