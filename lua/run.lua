cmd = vim.cmd 
api = vim.api

local M = {}
local config = require("run.config") 

local path = vim.fn.expand("%:p")
local name = vim.fn.expand("%:t:r")
local dir = vim.fn.expand("%:p:h")

M.setup = function(opts)     
  for a, b in pairs(opts or {}) do 
    for c, d in pairs(opts[a] or {}) do 
      config[a][c] = d
    end
  end
  api.nvim_create_user_command("Run", function()
    M.run() 
  end, {})
end

M.run = function()
  local command = ""
  for a, b in pairs(config.cmd) do
    if vim.bo.filetype == a then
      command = string.gsub(string.gsub(string.gsub(b, "$dir", dir), "$path", path), "$name", name)
    end
  end
  
  local buffer = api.nvim_create_buf(false, true)
  local height = api.nvim_win_get_height(0)
  local width = api.nvim_win_get_width(0)
  local win = api.nvim_open_win(buffer, true, {
    relative = "win",
    width = width - math.floor(width * config.ui.gap),
    height = height - math.floor(height * config.ui.gap),
    col = math.floor(width * config.ui.gap / 2),
    row = math.floor(height * config.ui.gap / 2),
    border = config.ui.border,
    style = "minimal",
  })
  cmd("terminal " .. command)
  cmd("startinsert")

end

return M
