return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Language Servers
        "bash-language-server", -- bashls
        "eslint-lsp", -- eslint
        "json-lsp", -- jsonls
        "lua-language-server", -- lua_ls
        "typescript-language-server", -- tsserver
        "css-lsp", -- css-lsp
        "tailwindcss-language-server", -- tailwindcss
        "prisma-language-server", -- prismals
        "pyright", -- pyright
        "ruff", -- ruff
        "sqlfluff", -- sqlfluff
        "taplo", -- taplo (for TOML)
        "markdownlint-cli2", -- markdownlint
        "marksman", -- marksman (for markdown)

        -- Linters and Formatters
        "stylua", -- stylua (for Lua formatting)
        "selene", -- selene (Lua linter)
        "luacheck", -- luacheck (Lua linter)
        "shellcheck", -- shellcheck (for shell script linting)
        "shfmt", -- shfmt (for shell script formatting)
        "prettier", -- prettier (for general code formatting)
      })
    end,
  },
  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            formtat = true,
            -- Add a `project` option for ESLint's TypeScript parser
            typescript = {
              project = "./tsconfig.json", -- Explicitly set the tsconfig path
            },
          },
          setup = function()
            local auto_format = true -- Set this according to your needs

            if not auto_format then
              return
            end

            local function get_client(buf)
              return vim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
            end

            local formatter = {
              name = "eslint: lsp",
              primary = false,
              priority = 200,
              filter = "eslint",
              format = function(buf)
                local client = get_client(buf)
                if client then
                  local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                  if #diag > 0 then
                    vim.cmd("EslintFixAll")
                  end
                end
              end,
            }

            if vim.fn.has("nvim-0.10") == 1 then
              LazyVim.lsp.formatter(formatter)
            end
          end,
        },
      },
      -- ✅ Add diagnostic settings for better visibility
      diagnostics = {
        virtual_text = {
          prefix = "●", -- Symbol for inline errors
          spacing = 4, -- Space between text and error
          source = "if_many",
          wrap = true, -- Try enabling text wrapping
        },
        float = {
          border = "rounded", -- Rounded border for floating diagnostics
          focusable = false, -- Prevent accidental clicks
        },
      },
      on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end,
    },
  },
}
