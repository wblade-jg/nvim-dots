local dap = require "dap"
local dapui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"

-- ── UI ──────────────────────────────────────────────
dapui.setup()
dap_virtual_text.setup {
  enabled = true,
  highlight_changed_variables = true,
}

-- Auto abrir/cerrar UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- ── Signos ──────────────────────────────────────────
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

-- ── Python (debugpy via Mason) ──────────────────────
-- mason-nvim-dap instala debugpy solo; dap-python lo configura.
-- No llamar setup aquí porque ya se hace en plugins/dap.lua (ft=python).
-- Si debugpy no existe aún, instálalo con :MasonInstall debugpy

-- ── C / C++ / Rust (codelldb via Mason) ─────────────
local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/codelldb"
local mason_pkg = vim.fn.stdpath "data" .. "/mason/packages/codelldb/extension/adapter/codelldb"
local codelldb_cmd = vim.fn.executable(mason_bin) == 1 and mason_bin or mason_pkg

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_cmd,
    args = { "--port", "${port}" },
  },
}

local codelldb_launch = function(lang)
  return {
    {
      name = "Launch file (" .. lang .. ")",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
    {
      name = "Attach to process (" .. lang .. ")",
      type = "codelldb",
      request = "attach",
      pid = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

dap.configurations.c = codelldb_launch "C"
dap.configurations.cpp = codelldb_launch "C++"
dap.configurations.rust = {
  {
    name = "Launch Rust (codelldb)",
    type = "codelldb",
    request = "launch",
    program = function()
      -- intenta target/debug/<nombre-crate>, si no pide ruta
      local metadata = vim.fn.systemlist "cargo metadata --no-deps --format-version 1 2>/dev/null"
      if metadata and metadata[1] then
        local ok, json = pcall(vim.json.decode, metadata[1])
        if ok and json and json.packages and json.packages[1] then
          local target_dir = (json.target_directory or (vim.fn.getcwd() .. "/target"))
          local name = json.packages[1].name
          local candidate = target_dir .. "/debug/" .. name
          if vim.fn.executable(candidate) == 1 then
            return candidate
          end
        end
      end
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
  {
    name = "Attach to process (Rust)",
    type = "codelldb",
    request = "attach",
    pid = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}
