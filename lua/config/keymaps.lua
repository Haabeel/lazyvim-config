-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- NeoTree
vim.keymap.set("n", "<leader>o", function()
  require("neo-tree.command").execute({ action = "focus" })
end, { desc = "Focus NeoTree" })
vim.keymap.set("n", "<leader><tab>", "<C-w>w", { desc = "Focus Editor" })

-- clipboard
-- Delete to the black hole register
vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete to black hole register" })
vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete line to black hole register" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete character to black hole register" })
-- Copy Current Line's Diagnostic to a Register
vim.keymap.set("n", "<leader>ce", function()
  local diag = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })[1]
  if diag then
    vim.fn.setreg("+", diag.message) -- Copies to system clipboard
    print("Copied diagnostic: " .. diag.message)
  else
    print("No diagnostic on this line")
  end
end, { desc = "Copy Diagnostic Error" })

-- Increment / Increment
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split Window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Switch to the next buffer
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })

-- Switch to the previous buffer
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprev<CR>", { noremap = true, silent = true })

--Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- flash
local wk = require("which-key")

wk.add({
  { "<leader>z", group = "Flash" },
  {
    "<leader>zs",
    function()
      require("flash").jump()
    end,
    desc = "Flash Jump",
  },
  {
    "<leader>zt",
    function()
      require("flash").treesitter()
    end,
    desc = "Flash Treesitter",
  },
  {
    "<leader>zr",
    function()
      require("flash").treesitter_search()
    end,
    desc = "Flash treesitter Search",
  },
})
