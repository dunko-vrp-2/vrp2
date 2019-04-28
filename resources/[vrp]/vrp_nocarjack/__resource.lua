
description "vrp_nocarjack"

client_scripts{ 
  "@vrp/lib/utils.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "vrp.lua"
}
files{
  "cfg/nocarjack.lua"
}