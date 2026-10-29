-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "kiro",
  transparency = false,
}


M.nvdash = {
  load_on_startup = true,
  header = {
    "                                                       ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "               __    __          __           _      ",
    "     _      __/ /_  / /___ _____/ /__        (_)___ _",
    "    | | /| / / __ \\/ / __ `/ __  / _ \\______/ / __ `/",
    "    | |/ |/ / /_/ / / /_/ / /_/ /  __/_____/ / /_/ / ",
    "    |__/|__/_ ___/_/\\__ _/\\__ _/\\___/   __/ /\\__  /  ",
    "                                       /___//____/   ", 
  },
}

M.ui = {
  tabufline = {
    lazyload = false, -- mostrar la barra de buffers siempre, aunque haya 1 solo
    order = { "treeOffset", "buffers", "tabs" }, -- sin "btns": se van los iconos del final
  },
}

-- term va a nivel raíz (hermano de ui), como lo lee nvchad.term
M.term = {
  float = {
    width = 0.75, -- 75% del ancho
    height = 0.7, -- 70% del alto
    col = 0.125, -- centrada horizontal ((1-0.75)/2)
    row = 0.15, -- centrada vertical ((1-0.7)/2)
  },
}

return M
