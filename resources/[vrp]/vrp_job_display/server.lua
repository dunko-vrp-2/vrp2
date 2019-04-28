local Group_Display = class("Group_Display2", vRP.Extension)

function Group_Display:__construct()
  vRP.Extension.__construct(self)

  self.cfg = module("vrp_job_display", "cfg/display")  
end

-- EVENT
Group_Display.event = {}

function Group_Display.event:playerSpawn(user, first_spawn)
    if first_spawn then
		local job = user:getGroupByType("job")
		job = vRP.EXT.Group:getGroupTitle(job)
		vRP.EXT.GUI.remote._setDiv(user.source,"job",self.cfg.display_css,job)
    end
end

function Group_Display.event:playerJoinGroup(user, name, gtype)
    if gtype == "job" then
		local job = vRP.EXT.Group:getGroupTitle(name)
		
		vRP.EXT.GUI.remote._setDivContent(user.source,"job",job)
    end
end

function Group_Display.event:playerLeaveGroup(user, name, gtype)
    if gtype == "job" then
	vRP.EXT.GUI.remote._setDivContent(user.source,"job","")
    end
end



vRP:registerExtension(Group_Display)
