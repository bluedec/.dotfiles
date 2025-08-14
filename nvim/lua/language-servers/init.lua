
local servers = {
  "lua_ls",
  "html",
  "ts_ls",
  "emmet_language_server",
}

for _, server in ipairs(servers) do
  require("language-servers." .. server)
end
