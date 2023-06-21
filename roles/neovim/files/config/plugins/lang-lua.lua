return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            config = {
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
              },
            },
            diagnostics = {
              globals = {
                "vim",
              },
            },
          },
        },
      },
    },
  },
}
