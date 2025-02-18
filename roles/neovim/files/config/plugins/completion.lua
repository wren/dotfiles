return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-n>"] = { "show", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
      ["<S-esc>"] = { "cancel", "fallback" },
    },
  },
}
