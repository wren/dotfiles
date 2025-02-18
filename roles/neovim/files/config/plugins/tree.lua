return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- when true, filtered are displayed differently
        hide_dotfiles = false,
      },
    },

    window = {
      mappings = {
        ["z"] = "none",
        ["S"] = "none",
        ["s"] = "none",
        ["-"] = "open_split",
        ["\\"] = "open_vsplit",
      },
    },

    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          require("neo-tree").close_all()
        end,
      },
    },
  },
}
