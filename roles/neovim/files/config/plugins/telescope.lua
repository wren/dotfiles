local t = function()
	return require("telescope.builtin")
end
return {
	-- change some telescope options
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			-- add a keymap to browse plugin files
			{
				"<leader>fp",
				function()
					t().find_files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
		},
		-- change some options
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"^.git/",
					"/Alfred.alfredpreferences/",
				},
			},
			pickers = {
				find_files = { theme = "ivy" },
				buffers = { theme = "ivy" },
				commands = { theme = "ivy" },
			},
		},
	},

	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
}
