-- Kiro Dark theme for NvChad / base46
-- Colors extracted from the Kiro IDE dark theme

local M = {}

M.base_30 = {
  white = "#ffffff",
  darker_black = "#19161d",
  black = "#211d25", -- nvim bg (editor background)
  black2 = "#28242e", -- sidebar / panels
  one_bg = "#28242e",
  one_bg2 = "#2f2a35",
  one_bg3 = "#38313f",
  grey = "#4a4354",
  grey_fg = "#938f9b",
  grey_fg2 = "#938f9b",
  light_grey = "#938f9b",
  red = "#ff8080",
  baby_pink = "#ff80b5",
  pink = "#ff80b5",
  line = "#2f2a35",
  green = "#80ffb5",
  vibrant_green = "#80ffb5",
  nord_blue = "#8dc8fb",
  blue = "#8dc8fb",
  yellow = "#ffcf99",
  sun = "#ffcf99",
  purple = "#b080ff",
  dark_purple = "#b080ff",
  teal = "#80f4ff",
  orange = "#ffcf99",
  cyan = "#80f4ff",
  statusline_bg = "#28242e",
  lightbg = "#2f2a35",
  pmenu_bg = "#b080ff",
  folder_bg = "#b080ff",
}

M.base_16 = {
  base00 = "#211d25",
  base01 = "#28242e",
  base02 = "#2f2a35",
  base03 = "#938f9b",
  base04 = "#938f9b",
  base05 = "#ffffff",
  base06 = "#ffffff",
  base07 = "#ffffff",
  base08 = "#ff80b5",
  base09 = "#ffcf99",
  base0A = "#ffcf99",
  base0B = "#80ffb5",
  base0C = "#80f4ff",
  base0D = "#8dc8fb",
  base0E = "#b080ff",
  base0F = "#ff8080",
}

M.polish_hl = {
  treesitter = {
    ["@keyword"] = { fg = "#e2d3fe" },
    ["@function"] = { fg = "#8dc8fb" },
    ["@function.call"] = { fg = "#8dc8fb" },
    ["@method"] = { fg = "#ffcf99" },
    ["@method.call"] = { fg = "#ffcf99" },
    ["@string"] = { fg = "#80ffb5" },
    ["@variable"] = { fg = "#80f4ff" },
    ["@variable.builtin"] = { fg = "#80f4ff" },
    ["@variable.parameter"] = { fg = "#80f4ff" },
    ["@type"] = { fg = "#ff80b5" },
    ["@type.builtin"] = { fg = "#ff80b5" },
    ["@constructor"] = { fg = "#ff80b5" },
    ["@constant"] = { fg = "#ff80b5" },
    ["@constant.builtin"] = { fg = "#ff80b5" },
    ["@number"] = { fg = "#ffcf99" },
    ["@comment"] = { fg = "#938f9b", italic = true },
    ["@property"] = { fg = "#80f4ff" },
    ["@field"] = { fg = "#80f4ff" },
    ["@attribute"] = { fg = "#b080ff" },
    ["@tag"] = { fg = "#b080ff" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "kiro")

return M
