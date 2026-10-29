return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    opts = {
      enabled = true,
      highlight_changed_variables = true,
    },
  },

  -- Adaptador Python (usa debugpy instalado por Mason)
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local debugpy = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(debugpy)
    end,
  },

  -- Auto-instala y configura adaptadores via Mason
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "python", "codelldb" },
      automatic_installation = true,
      handlers = {},
    },
  },
}
