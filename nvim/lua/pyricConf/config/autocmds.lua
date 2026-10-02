local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*", -- Apply to all filetypes
	callback = function(args)
		-- Skip if already highlighted or special buffer
		if vim.b.ts_highlight or vim.bo[args.buf].buftype ~= "" then
			return
		end

		-- Set default filetype for empty buffers
		if vim.bo[args.buf].filetype == "" then
			vim.bo[args.buf].filetype = "text"
		end

		-- Only start if we have a valid filetype
		if vim.bo[args.buf].filetype ~= "text" then
			vim.treesitter.start(args.buf)
		end
	end,
})
