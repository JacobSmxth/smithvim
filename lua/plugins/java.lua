return {
  -- Configure treesitter for Java
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "java",
      })
    end,
  },

  -- Configure Mason to ensure Java tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "jdtls",
        "java-debug-adapter",
        "java-test",
      })
    end,
  },

  -- Java-specific editor settings
  {
    "nvim-lspconfig",
    opts = function()
      -- Java-only editor settings
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
          vim.opt_local.shiftwidth = 4
          vim.opt_local.expandtab = true
          vim.opt_local.colorcolumn = "100"
        end,
      })
    end,
  },

  -- Java keymaps (buffer-local)
  {
    "mfussenegger/nvim-jdtls",
    keys = {
      { "<leader>jo", "<cmd>lua require('jdtls').organize_imports()<cr>", desc = "Organize Imports", ft = "java" },
      { "<leader>jv", "<cmd>lua require('jdtls').extract_variable()<cr>", desc = "Extract Variable", ft = "java", mode = "v" },
      { "<leader>jm", "<cmd>lua require('jdtls').extract_method(true)<cr>", desc = "Extract Method", ft = "java", mode = "v" },
      { "<leader>jtm", "<cmd>lua require('jdtls').test_nearest_method()<cr>", desc = "Test Method", ft = "java" },
      { "<leader>jtc", "<cmd>lua require('jdtls').test_class()<cr>", desc = "Test Class", ft = "java" },
    },
  },
}