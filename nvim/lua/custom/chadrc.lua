---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'nightfox',
  hl_override = require("custom.highlights"),
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
