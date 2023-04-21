-- A thing for when you open the other thing
local plugin = lvim.builtin.alpha.dashboard

-- disabled by default, so enable it
plugin.active = true

-- Set header
plugin.section.header.val = {
    '                                                     ',
    '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
    '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
    '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
    '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
    '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
    '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
    '                                                     ',
}

local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if status_ok then
  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Macro"
    return b
  end
  plugin.section.buttons.val = {
    button("p", "  Find Files in Project", "<CMD>Telescope find_files<cr>"),
    button("e", "  New File", "<CMD>ene!<cr>"),
    button("s", "  Restore session", ":silent RestoreSession<cr>"),
    button("r", "  Recent files", ":Telescope oldfiles<cr>"),
    button("f", "  Find Text", ":Telescope live_grep<cr>"),
    button(
      "c",
      "  Configuration",
      "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>"
    ),
  }
end
