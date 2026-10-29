return {
  {
    "avante-corp/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    -- @module 'avante'
    -- @type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "AGENTS.md",
      -- for example
      provider = "devin",
      acp_providers = {
        devin = {
          command = "devin",
          args = { "acp" },
        },
      },
    },
    config = function(_, opts)
      require("avante").setup(opts)
      -- Silence Devin-specific ACP notifications that avante.nvim does not yet handle.
      local ok, acp_client = pcall(require, "avante.libs.acp_client")
      if ok then
        local orig = acp_client._handle_notification
        acp_client._handle_notification = function(self, message_id, method, params)
          if method and method:match("^_cognition%.ai/") then
            return
          end
          return orig(self, message_id, method, params)
        end
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "ColinKennedy/mega.cmdparse",
        dependencies = { "ColinKennedy/mega.logging" },
      },
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  },
}
