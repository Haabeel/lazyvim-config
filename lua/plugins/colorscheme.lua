return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      return {
        flavour = "mocha",
        transparent_background = true,
      }
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    name = "gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_transparent_background = 2
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    name = "onedarkpro",
    config = function()
      require("onedarkpro").setup({
        styles = {
          types = "bold",
          functions = "bold",
          methods = "bold",
        },
        options = {
          transparency = true,
        },
      })
    end,
  },
  {
    "nobbmaestro/nvim-andromeda",
    name = "andromeda",
    priority = 1000,
    dependencies = {
      { "tjdevries/colorbuddy.nvim", branch = "dev" },
    },
    config = function()
      require("andromeda").setup({
        transparent_bg = true,
      })
    end,
  },
}
