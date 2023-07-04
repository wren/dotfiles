return {
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  {
    -- overlay for jumping to places in the buffer (e.g. press "f")
    "phaazon/hop.nvim",
    event = "BufRead",
    keys = {
      { "f", "<cmd>HopWord<cr>", desc = "Hop Word" },
      { "F", "<cmd>HopChar1<cr>", desc = "Hop Character" },
    },
    config = true,
  },
}
