return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      bind_to_cwd = false,
    },
    keys = function()
      return {
        {
          "<leader>e",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
          end,
          desc = "Explorer NeoTree",
        },
      }
    end,

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
