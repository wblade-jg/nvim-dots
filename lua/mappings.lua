require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- ── nvim-dap ──
-- F-keys estilo VSCode
map("n", "<F5>", function() require("dap").continue() end, { desc = "DAP Continue" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP Step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP Step into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP Step out" })

-- leader-d
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP Toggle breakpoint" })
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "DAP Conditional breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP Continue" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "DAP Step over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP Step into" })
map("n", "<leader>dO", function() require("dap").step_out() end, { desc = "DAP Step out" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "DAP REPL" })
map("n", "<leader>dl", function() require("dap").run_last() end, { desc = "DAP Run last" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "DAP Terminate" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "DAP UI toggle" })

-- ── proyectos ──
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Projects: buscar proyecto" })

-- ── git (Source Control estilo VS Code/Kiro) ──
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git: diff de cambios (panel izq)" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Git: historial de la rama" })
map("n", "<leader>gD", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git: historial del archivo" })
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "Git: cerrar diff" })
