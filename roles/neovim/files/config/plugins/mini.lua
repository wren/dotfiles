return {
  {
    "nvim-mini/mini.trailspace",
    config = true,
    keys = {
      { "<leader>c<space>", ":lua MiniTrailspace.trim()<cr>", desc = "Delete trailing spaces" },
    },
  },

  {
    {
      "nvim-mini/mini.surround",
      opts = {
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
        },
      },
    },
  },
}
