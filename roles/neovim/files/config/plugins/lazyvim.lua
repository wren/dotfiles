return {
  -- { import = "lazyvim.plugins.extras.coding.copilot" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.lang.json" },
  -- { import = "lazyvim.plugins.extras.ui.edgy" },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.opts.hl = "Label"
      opts.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      opts.opts.layout[1].val = 3
      opts.shrink_margin = true
      return opts
    end,
  },
}