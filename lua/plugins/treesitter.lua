return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Language support
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "rust",
        "php",
        "scss",
        "sql",
        "svelte",

        -- React/Next.js essentials
        "javascript", -- JavaScript for React/Next.js
        "typescript", -- TypeScript for React/Next.js
        "html", -- HTML (for JSX components)
        "json", -- JSON for config files
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX Support for Next.js
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.filetype.add({
        pattern = {
          [".*%.tsx$"] = "typescriptreact",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
