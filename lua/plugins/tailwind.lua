return {
  "catgoose/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      -- Enable virtual text
      virtualtext = "■", -- You can use any character or symbol for the virtual text
      -- Define Tailwind CSS color patterns
      user_default_options = {
        tailwind = true, -- Enable Tailwind CSS support
        mode = "virtualtext", -- Display mode: 'background', 'foreground', or 'virtualtext'
        RGB = true, -- Enable RGB color parsing
        RRGGBB = true, -- Enable RRGGBB color parsing
        names = true, -- Disable color name parsing (e.g., "red")
        RRGGBBAA = false, -- Disable RRGGBBAA color parsing
        rgb_fn = false, -- Disable RGB function parsing
        hsl_fn = false, -- Disable HSL function parsing
        css = false, -- Disable CSS color parsing
        css_fn = false, -- Disable CSS function parsing
        virtualtext_inline = "before",
      },
      -- Add custom Tailwind CSS colors
      filetypes = {
        "*", -- Apply to all file types
      },
      buftypes = {
        "*", -- Apply to all buffer types
      },
    })
  end,
}
