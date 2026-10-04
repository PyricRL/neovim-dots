require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		bash = { "shfmt" },
		python = { "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		rust = { "rustfmt" },
		qmljs = { "qmlformat" },
		qml = { "qmlformat" },
		yaml = { "prettier" },
		ini = { "inifmt" },
	},
	format_on_save = {
		lsp_fallback = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
