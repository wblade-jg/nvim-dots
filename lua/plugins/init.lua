return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- ── Gestión de proyectos ──
  {
    "DrKJeff16/project.nvim",
    event = "VeryLazy",
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "Makefile", "package.json", "pyproject.toml", "Cargo.toml", "go.mod" },
      silent_chdir = false,
      scope_chdir = "global",
    },
    config = function(_, opts)
      require("project").setup(opts)
      local status_ok, telescope = pcall(require, "telescope")
      if status_ok then
        telescope.load_extension("projects")
      end
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = { adapter = "opencode" },
          inline = { adapter = "opencode" },
        },
        adapters = {
          opencode = function()
            return require("codecompanion.adapters").extend("opencode", {
              schema = {
                model = {
                  default = "mimo-v2.5",
                },
              },
            })
          end,
        }
      })
    end,
  },
    
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
      })
      
      vim.keymap.set("i", "<A-f>", function()
        neocodeium.accept()
      end)
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory",
      "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh",
    },
    config = function()
      require("diffview").setup({
        use_icons = true,
        enhanced_diff_hl = true,
        view = {
          default = { layout = "diff2_vertical" },
        },
        file_panel = {
          listing_style = "tree",
          win_config = { position = "left", width = 35 },
        },
        winbar_info = true,
      })
    end,
  },
}
