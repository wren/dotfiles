-- This plugin is, unfortunately, very difficult to
-- configure, and requires a lot of cruft in the
-- global namespace. But it's the only one that
-- handles bullets that way I need, so here we are.
g.bullets_enabled_file_types = {
  "markdown",
  "text",
  "gitcommit",
  "scratch",
  "jrnl",
}

-- don't user default keymaps
g.bullets_set_mappings = 0

g.bullets_checkbox_markers = " .x"
g.bullets_enable_in_empty_buffers = 1
g.bullets_mapping_leader = ""
g.bullets_delete_last_bullet_if_empty = 1
g.bullets_line_spacing = 1
g.bullets_auto_indent_after_colon = 1
g.bullets_max_alpha_characters = 1
g.bullets_renumber_on_change = 1
g.bullets_checkbox_partials_toggle = 0

g.bullets_outline_levels = { "ROM", "ABC", "num", "abc", "rom", "std-" }

g.bullets_custom_mappings = {
  { "imap", "<cr>", "<Plug>(bullets-newline)" },
  { "inoremap", "<C-cr>", "<cr>" },
  { "nmap", "o", "<Plug>(bullets-newline)" },
  { "vmap", "gN", "<Plug>(bullets-renumber)" },
  { "nmap", "gN", "<Plug>(bullets-renumber)" },
  { "imap", "<tab>", "<Plug>(bullets-demote)" },
  { "nmap", ">>", "<Plug>(bullets-demote)" },
  { "vmap", ">", "<Plug>(bullets-demote)" },
  { "imap", "<s-tab>", "<Plug>(bullets-promote)" },
  { "nmap", "<<", "<Plug>(bullets-promote)" },
  { "vmap", "<", "<Plug>(bullets-promote)" },
}

return {
  -- Manages bulleted lists
  "dkarter/bullets.vim",

  ft = { "jrnl", "markdown" },

  config = function()
    map("n", "<c-cr>", "<Plug>(bullets-toggle-checkbox)", {
      silent = true,
      desc = "Toggle checkbox",
    })
  end,
}
