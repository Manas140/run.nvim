local file = vim.fn.expand("%")
local fileWithoutExt = vim.fn.expand("%:t:r")

local commands = {
  -- ["filetype"] = "command" .. current_file_path,
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
  ["java"] = "javac " .. file .. "&& java " .. fileWithoutExt,
  --["kotlin"] = "kotlin " .. file,
  --["cs"] = "mono " .. file,
}

return commands
