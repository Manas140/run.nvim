local path = vim.fn.expand("%:p")
local name = vim.fn.expand("%:t:r")
local dir = vim.fn.expand("%:p:h")

local commands = {
  ["c"] = "cd " .. dir .. " && gcc " .. path .. " && ./a.out",
  ["cpp"] = "cd " .. dir .. " && g++ " .. path .. " && ./a.out",
  ["dart"] = "dart " .. path,
  ["go"] = "go run " .. path,
  ["html"] = "xdg-open " ..  path,
  ["java"] = "cd " .. dir .. " && javac " .. path .. "&& java " .. name,
  ["javascript"] = "js78 " .. path,
  ["lua"] = "lua " .. path,
  ["perl"] = "perl " .. path,
  ["php"] = "php " .. path,
  ["python"] = "python " .. path,
  ["r"] = "Rscript " .. path,
  ["rust"] = "cd " .. dir .. " && rustc " .. path .. " && ./" .. name,
  ["cargo"] = "cd " .. dir .. " && cargo run",
  ["sh"] = ". " .. path,
  ["swift"] = "swift " .. path,
  ["png"] = "xdg-open " .. path,
}

return commands
