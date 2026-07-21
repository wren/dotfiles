return {
  -- Manages bulleted lists
  "njg7194/openclaw.nvim",
  config = function()
    require("openclaw").setup({
      -- OpenClaw CLI command (change if using WSL or custom path)
      command = "openclaw",

      -- Automatically connect on startup
      auto_connect = false,

      -- Status refresh interval in milliseconds (0 to disable)
      status_refresh_ms = 5000,

      -- Show notifications on status changes
      notify_on_status_change = true,
    })
  end,
}
