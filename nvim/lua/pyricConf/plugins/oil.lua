require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
		"size",
		"mtime",
	},

	buf_options = {
		buflisted = true,
		bufhidden = "hide",
	},

	win_options = {
		wrap = false,
		signcolumn = "yes",
		cursorcolumn = true,
	},

	delete_to_trash = false,

	skip_confirm_for_simple_edits = true,

	prompt_save_on_select_new_entry = true,

	cleanup_delay_ms = 5000,

	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = false,
	},

	constrain_cursor = "editable",

	watch_for_changes = true,

	use_default_keymaps = true,

	view_options = {
		show_hidden = true,

		natural_order = "fast",

		case_insensitive = false,

		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},

		git_status = true,
	},
})

vim.keymap.set({ "n", "x", "o" }, "<leader>u", "<CMD>Oil<CR>", { desc = "Open file explorer" })
