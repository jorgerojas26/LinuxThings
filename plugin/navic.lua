local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require("icons")

navic.setup({
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})
