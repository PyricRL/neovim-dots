require("gitsigns").setup({
  signs = {
    add = { text = "|" },
    change = { text = "|" },
    delete = { text = "_" },
    untracked = { text = "*" },
  },
  on_attach = function(bufnr)
    -- Ensure GitSigns works in Oil buffers
    if vim.bo[bufnr].filetype == "oil" then
      vim.api.nvim_create_autocmd("BufEnter", {
        buffer = bufnr,
        callback = function()
          require("gitsigns").attach(bufnr)
        end,
      })
    end
  end,
})

