cmd = vim.cmd 
api = vim.api

local M = {}
local commands = require("run.commands")

local Opts = {
  border = "rounded",
  gap = 0.2
}

M.setup = function(opts)     
  for a, b in pairs(opts or {}) do 
    Opts[a] = b
  end

  api.nvim_create_user_command("Run", function()
    for k in pairs(package.loaded) do 
      if k:match("^run") then
        package.loaded[k] = nil 
      end 
    end
    require('run').run() 
  end, {})
end

M.run = function()
  local command = ""
  for i, x in pairs(commands) do
    if vim.bo.filetype == i then
      command = x
    end
  end
  
  local buffer = api.nvim_create_buf(false, true)
  local height = api.nvim_win_get_height(0)
  local width = api.nvim_win_get_width(0)
  local win = api.nvim_open_win(buffer, true, {
    relative = "win",
    width = width - math.floor(width * Opts.gap),
    height = height - math.floor(height * Opts.gap),
    col = math.floor(width * Opts.gap / 2),
    row = math.floor(height * Opts.gap / 2),
    border = Opts.border,
    style = "minimal",
  })
  cmd("terminal " .. command)
  cmd("startinsert")
end

return M
