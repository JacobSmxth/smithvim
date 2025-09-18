return {
  -- Minimal Lualine without icons
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = { "dashboard", "alpha" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  -- Neo-tree with minimal icons
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        icon = {
          folder_closed = "+",
          folder_open = "-",
          folder_empty = "o",
          default = " ",
        },
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "?",
            ignored = "!",
            unstaged = "U",
            staged = "S",
            conflict = "C",
          },
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules",
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
    },
  },

  -- Snacks dashboard with SmithVim header and default keys
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███████╗███╗   ███╗██╗████████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
██╔════╝████╗ ████║██║╚══██╔══╝██║  ██║██║   ██║██║████╗ ████║
███████╗██╔████╔██║██║   ██║   ███████║██║   ██║██║██╔████╔██║
╚════██║██║╚██╔╝██║██║   ██║   ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████║██║ ╚═╝ ██║██║   ██║   ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝     ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
      },
    },
  },

  -- Disable noice for simpler UI
  {
    "folke/noice.nvim",
    enabled = false,
  },

  -- Simple notify
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      fps = 30,
      icons = {
        DEBUG = "D",
        ERROR = "E",
        INFO = "I",
        TRACE = "T",
        WARN = "W",
      },
      level = 2,
      minimum_width = 50,
      render = "minimal",
      stages = "fade_in_slide_out",
      timeout = 5000,
      top_down = true,
    },
  },

  -- Minimal bufferline (optional, can be disabled)
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = "thin",
        indicator = {
          style = "none",
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  -- Disable indentscope on dashboard
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "|",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "dashboard",
          "snacks_dashboard",
          "alpha",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "notify",
          "toggleterm",
          "Trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
