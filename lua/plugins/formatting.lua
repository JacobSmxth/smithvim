return {
  -- Conform.nvim for unified formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        -- Java formatting is handled by JDTLS
      },
      format_on_save = function(bufnr)
        -- Disable format_on_save for large files
        if vim.api.nvim_buf_line_count(bufnr) > 1000 then
          return
        end

        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters = {
        prettierd = {
          env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/.prettierrc.json"),
          },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  -- Optional: Create a basic prettier config
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Create a basic .prettierrc.json if it doesn't exist
      local prettier_config = vim.fn.expand("~/.config/nvim/.prettierrc.json")
      if vim.fn.filereadable(prettier_config) == 0 then
        local config = {
          semi = true,
          singleQuote = false,
          tabWidth = 2,
          trailingComma = "es5",
          printWidth = 100,
        }
        vim.fn.writefile({ vim.fn.json_encode(config) }, prettier_config)
      end
    end,
  },
}