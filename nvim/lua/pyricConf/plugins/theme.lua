vim.g.ayucolor = "dark"

-- 1. Register the autocommand to run AFTER any colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Custom diagnostic lines
    local palette = {
      err = "#3d2429",
      warn = "#3a3024",
      info = "#242f3d",
      hint = "#24373d",
    }

    vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err, blend = 20 })
    vim.api.nvim_set_hl(0, "DiagnosticWarnLine",  { bg = palette.warn, blend = 15 })
    vim.api.nvim_set_hl(0, "DiagnosticInfoLine",  { bg = palette.info, blend = 10 })
    vim.api.nvim_set_hl(0, "DiagnosticHintLine",  { bg = palette.hint, blend = 10 })

    -- Target standard IBL highlight groups
    vim.api.nvim_set_hl(0, "IblIndent", { fg = "#1e1e24", nocombine = true, default = false })
    vim.api.nvim_set_hl(0, "IblScope",  { fg = "#ff9e64", nocombine = true, default = false })
  end,
})

-- 2. Trigger the colorscheme ONCE at the end
pcall(vim.cmd.colorscheme, "ayu")
