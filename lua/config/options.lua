-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Undercurl
vim.o.termguicolors = true
vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- Enable undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- Reset undercurl

-- word wrap
vim.opt.wrap = true

-- Error Display
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

-- scroll offset
vim.o.scrolloff = 0

vim.opt.wildignore:append({ "node_modules/**" })
