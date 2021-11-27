local options = require("Run.options")
local commands = require("Run.commands")

local function main()
  --file
  local command = ""
  for i, x in pairs(commands) do
    if vim.bo.filetype == i then
      command = x
    end
  end
  
  --window
  local height = vim.api.nvim_win_get_height(0)
  local width = vim.api.nvim_win_get_width(0)
  local buffer = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buffer, true, {
    relative = "win",
    width = width - math.floor(width * options.gap),
    height = height - math.floor(height * options.gap),
    col = math.floor(width * options.gap / 2),
    row = math.floor(height * options.gap / 2),
    border = options.border,
    style = "minimal",
  })

  --terminal
  vim.api.nvim_win_set_option(0, 'winhl', 'Normal:MyHighlight')
  vim.cmd("terminal " .. command)
  vim.cmd("startinsert")
end

return {
  main = main
}
