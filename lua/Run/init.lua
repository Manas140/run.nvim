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
  local ui = vim.api.nvim_list_uis()[1]
  local buffer = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buffer, true, {
    relative = "editor",
    width = ui.width - (options.gap * 2),
    height = ui.height - (options.gap * 2), 
    col = options.gap,
    row = options.gap,
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
