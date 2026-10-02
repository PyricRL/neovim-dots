-- Lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

-- Rust
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = { enable = true },
		},
	},
})

-- C/C++
vim.lsp.config("clangd", {})

-- QML
vim.lsp.config("qmlls", {
	filetypes = { "qml", "qmljs" },
})

-- Nix
vim.lsp.config("nixd", {})

-- Enable lsp servers
vim.lsp.enable("lua_ls", "rust_analyzer", "clangd", "qmlls", "nixd")

-- Keybindings (same as before)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code Rename" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover (alt)" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

-- Auto-attach LSP for all filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*", -- Match all filetypes
	callback = function(args)
		local filetype = vim.bo[args.buf].filetype
		local lsp_servers = {
			lua = "lua_ls",
			rust = "rust_analyzer",
			c = "clangd",
			cpp = "clangd",
			nix = "nixd",
			typescript = "tsserver",
			javascript = "tsserver",
			qmljs = "qmlls",
			python = "pyright",
		}

		local server = lsp_servers[filetype]
		if server then
			vim.lsp.start({
				name = server,
				cmd = { server }, -- Assumes server is in $PATH
				root_dir = vim.fn.getcwd(), -- Force current directory
			})
		end
	end,
})
