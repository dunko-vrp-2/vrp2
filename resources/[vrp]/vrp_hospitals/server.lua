local cfg = module("vrp_hospitals", "cfg/hospitals")



local Heal = class("Heal", vRP.Extension)



local function menu_hospitals(self)

    local function m_basicheal(menu)
        local user = menu.user

	local payment = cfg.basicheal
	if user:tryFullPayment(payment) then
	vRP.EXT.Survival.remote._varyHealth(user.source,15)

	vRP.EXT.Base.remote._notify(user.source, "Paid ~g~$"..payment)
    end
end

    local function m_fullheal(menu)
        local user = menu.user

	local payment = cfg.fullheal
	if user:tryFullPayment(payment) then
	vRP.EXT.Survival.remote._varyHealth(user.source,100)

	vRP.EXT.Base.remote._notify(user.source, "Paid ~g~$"..payment)
    end
end

    local function m_armourheal(menu)
        local user = menu.user

	local payment = cfg.armourheal
	if user:tryFullPayment(payment) then
	vRP.EXT.Survival.remote._varyHealth(user.source,100)
	vRP.EXT.PlayerState.remote._setArmour(user.source, 200)

	vRP.EXT.Base.remote._notify(user.source, "Paid ~g~$"..payment)
    end
end


    vRP.EXT.GUI:registerMenuBuilder("hospital", function(menu)
        local user = menu.user
        menu.title = "Hospital"
        menu.css.header_color = "rgba(0,255,0,0.75)"
        menu:addOption("Basic Heal", m_basicheal, cfg.lang.basicheal)
        menu:addOption("Full Heal", m_fullheal, cfg.lang.fullheal)
        menu:addOption("Advanced Heal", m_armourheal, cfg.lang.armourheal)
    end)

end

-- METHODS

function Heal:__construct()
  vRP.Extension.__construct(self)

  self.cfg = module("vrp_hospitals", "cfg/hospitals")

  menu_hospitals(self)

end


-- EVENT
Heal.event = {}

function Heal.event:playerSpawn(user, first_spawn)
    if first_spawn then
        for k, v in pairs(self.cfg.hospitals) do
            local gcfg = v._config

            if gcfg then
                local x = gcfg.x
                local y = gcfg.y
                local z = gcfg.z

                local function enter(user)
                    menu = user:openMenu("hospital")
                end

            local function leave(user)
                user:closeMenu()
            end

        local ment = clone(gcfg.map_entity)
        ment[2].title = self.cfg.lang.title
        ment[2].pos = {x,y,z-1}
        vRP.EXT.Map.remote._addEntity(user.source, ment[1], ment[2])
        user:setArea("vRP:cfg.hospitals" .. k, x, y, z, 1, 1.5, enter, leave)

    	    end
	end
    end
end



vRP:registerExtension(Heal)





