local file = vim.fn.expand("%:p")

local commands = {
  -- ["filetype"] = "command" .. current_file_path,
  -- ["lua"] = "lua " .. file,
  ["lua"] = "lua " .. file,
  ["python"] = "python " .. file,
  ["sh"] = ". " .. file,
  ["go"] = "go run " .. file,
  ["rust"] = "rust build " .. file .. " ",
  ["c"] = "gcc " .. file .. " && ./a.out && rm ./a.out",
  ["cpp"] = "g++ " .. file .. " && ./a.out && rm ./a.out",
  ["html"] = "xdg-open " ..  file,
  ["css"] = "",
  ["javascript"] = "js78 " .. file,
  ["java"] = "js78 " .. file,
  ["kotlin"] = "js78 " .. file,
  ["cs"] = "js78 " .. file,
  ["vim"] = "",
  [""] = ""
}

return commands
