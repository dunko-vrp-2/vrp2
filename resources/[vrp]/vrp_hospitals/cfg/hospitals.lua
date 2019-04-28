cfg = {}

cfg.hospitals = {

--locations
["1"] = {
      _config = {x= 338.85, y= -1394.56, z= 32.51, map_entity = {"PoI", {blip_id = 586, blip_color = 1, marker_id = 1, scale = {1.0,1.0,1.0},color={0, 255, 0,125} }}},
},

["2"] = {
      _config = {x = -449.67, y= -340.83, z= 34.50, map_entity = {"PoI", {blip_id = 586, blip_color = 1, marker_id = 1, scale = {1.0,1.0,1.0},color={0, 255, 0,125} }}},
},
["3"] = {
      _config = {x = 296.64, y= -602.74, z= 44.30, map_entity = {"PoI", {blip_id = 586, blip_color = 1, marker_id = 1, scale = {1.0,1.0,1.0},color={0, 255, 0,125} }}},
},

["4"] = {
      _config = {x = 1827.97, y= 3692.58, z= 34.22, map_entity = {"PoI", {blip_id = 586, blip_color = 1, marker_id = 1, scale = {1.0,1.0,1.0},color={0, 255, 0,125} }}},

  },
["5"] = {
      _config = {x = -239.89, y= 6323.59, z= 32.42, map_entity = {"PoI", {blip_id = 586, blip_color = 1, marker_id = 1, scale = {1.0,1.0,1.0},color={0, 255, 0,125} }}},

  }
}



cfg.basicheal = 500
cfg.fullheal = 1000
cfg.armourheal = 2000


--language
cfg.lang = {
  title = "Hospitals",
  basicheal = "$500<br />This will partly heal you.",
  fullheal = "$1000<br /><br />This will fully heal you.",
  armourheal = "$2000<br />This will fully heal you and apply armour"
}

return cfg
