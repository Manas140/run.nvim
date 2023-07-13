local cmd = vim.cmd
local api = vim.api
local o = vim.o
local fn = vim.fn

local M = {}
local conf = require("run.config")

local path = fn.expand("%:p")
local name = fn.expand("%:t:r")
local dir = fn.expand("%:p:h")

M.setup = function(opts)
  for a, _ in pairs(opts or {}) do
    for c, d in pairs(opts[a] or {}) do
      conf[a][c] = d
    end
  end
  api.nvim_create_user_command("Run", function()
    M.run()
  end, {})
end

M.run = function()
  local command = nil
  for a, b in pairs(conf.cmd) do
    if vim.bo.filetype == a then
      local switch = {
        {"$dir", dir},
        {"$name", name},
        {"$path", path},
      }
      for _, c in pairs(switch) do
        command = string.gsub((command or b), c[1], c[2])
      end
    end
  end

  local buffer = api.nvim_create_buf(false, true)
  local h, w = o.lines, o.columns

  M.win = api.nvim_open_win(buffer, true, {
    relative = "win",
    width = w - math.floor(w * conf.ui.gap),
    height = h - math.floor(h * conf.ui.gap) - 1,
    col = math.floor(w * conf.ui.gap / 2),
    row = math.floor(h * conf.ui.gap / 2) - 2,
    border = conf.ui.border,
    style = "minimal",
  })

  api.nvim_win_set_option(M.win, "winhl", "NormalFloat:"..conf.ui.bg..",FloatBorder:"..conf.ui.border_cl)

  cmd("terminal " .. (command or "Command not found for the specific filetype"))
  cmd("startinsert")

  api.nvim_create_autocmd("VimResized", {
    callback = function ()
      h, w = o.lines, o.columns

      local cfg = api.nvim_win_get_config(M.win)
      local row, col, height, width = cfg["row"][false], cfg["col"][false], cfg["height"], cfg["width"]

      width = w - math.floor(w * conf.ui.gap)
      height = h - math.floor(h * conf.ui.gap) - 1
      col = math.floor(w * conf.ui.gap / 2)
      row = math.floor(h * conf.ui.gap / 2) - 2

      cfg["row"][false], cfg["col"][false], cfg["height"], cfg["width"] = row, col, height, width

      api.nvim_win_set_config(M.win, cfg)
    end
  })
end

return M
