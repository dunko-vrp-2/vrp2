--[[
ROBBERY FORMAT:
	["id"] = { 
	  name = "Name",
	  pos = {x, y, z}, 
	  dist = radius, rob = seconds,	wait = seconds,	cops = minimum, stars = wanted, min = min_reward, max = max_reward
	},
	- id: unique id of the robbery used to identify it in the code
	- name: name of the robbery that will go on chat
	- pos: x, y, z - the pos of the robbery
	- dist: how far you can get from the robbery
	- rob: time in seconds to rob
	- wait: time in seconds to wait before it can be robbed again
	- cops: minimum amount of cops online necessary to rob
	- stars: stars aquired for robbing
	- min: minimum amount it can give as a reward
	- max: maximum amount it can give as a reward
]]
cfg = {}
cfg.lang = "en" -- set your lang (file must exist on cfg/lang)
cfg.key = 45 -- INPUT_RELOAD
cfg.cops = "police.menu"	 -- permission given to cops

cfg.bankrobbery = { -- list of robberies
	["fleeca2"] = { 
	 _config = {x = -2957.66, y = 481.45, z = 15.69, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Fleeca Bank (Highway)", 
	  pos = {-2957.6674804688, 481.45776367188, 15.697026252747}, 
	  dist = 15.0, rob = 360, wait = 2700, cops = 4, min = 100000, max = 200000 --100-200
	},
	["blainecounty"] = { 
 	_config = {x = -107.06, y = 6474.80, z = 31.62, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Blaine County Savings", 
	  pos = {-107.06505584717, 6474.8012695313, 31.62670135498}, 
	  dist = 15.0, rob = 360, wait = 2700, cops = 4, min = 100000, max = 200000
	},
	["fleeca3"] = { 
 	_config = {x = -1212.25, y = -336.12, z = 36.79, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Fleeca Bank (Rockford Hills)", 
	  pos = {-1212.2568359375, -336.128295898438, 36.7907638549805}, 
	  dist = 15.0, rob = 360, wait = 2700, cops = 4, min = 100000, max = 200000
	},
	["fleeca6"] = { 
 	_config = {x = 1176.86, y = 2711.91, z = 38.09, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Fleeca Bank (Desert)", 
	  pos = {1176.86865234375, 2711.91357421875, 38.097785949707}, 
	  dist = 15.0, rob = 360, wait = 2700, cops = 4, min = 100000, max = 200000
	},
	["pacific"] = { 
 	_config = {x = 255.00, y = 225.85, z = 101.00, map_entity = {"PoI", {blip_id = 431, blip_color = 1}}},
	  name = "Pacific Standards (Downtown Vinewood)", 
	  pos = {255.001098632813, 225.855895996094, 101.005694274902}, 
	  dist = 30.0, rob = 360, wait = 2700, cops = 4, min = 100000, max = 200000
	}
}


return cfg

