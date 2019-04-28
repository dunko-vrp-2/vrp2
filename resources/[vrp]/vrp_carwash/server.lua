local cfg = module("vrp_carwash", "cfg/carwash")
local lcfg = module("vrp", "cfg/base")

-- load global and local languages
Luang = module("vrp", "lib/Luang")
Lang = Luang()
Lang:loadLocale(lcfg.lang, module("vrp", "cfg/lang/"..lcfg.lang) or {})
lang = Lang.lang[lcfg.lang]


local CarWash = class("CarWash", vRP.Extension)


function CarWash:__construct()
  vRP.Extension.__construct(self)

  self.cfg = module("vrp_carwash", "cfg/carwash")
end

function CarWash:triggerClean(user)
    local vehicle = user:hasPermission("!in_vehicle")

    if vehicle then
        local dirt = self.remote.getDirtLevel(user.source)

        if parseFloat(dirt) > parseFloat(1.0) then
            local total = parseInt(parseFloat(dirt) * cfg.price)

            if user:tryFullPayment(math.floor(total)) then
                self.remote.cleanVehicle(user.source)
                vRP.EXT.Base.remote._notify(user.source, lang.money.paid({total}))
            else
                vRP.EXT.Base.remote._notify(user.source, lang.money.not_enough())
            end
        else
            vRP.EXT.Base.remote._notify(user.source, cfg.lang.cleaned)
        end
    else
        vRP.EXT.Base.remote._notify(user.source, cfg.lang.no_veh)
    end
end

-- EVENT
CarWash.event = {}

function CarWash.event:playerSpawn(user, first_spawn)
    if first_spawn then
        for k, v in pairs(self.cfg.carwash) do
            local gcfg = v._config

            if gcfg then
                local x = gcfg.x
                local y = gcfg.y
                local z = gcfg.z

                local function enter_carwash(user)
                    self:triggerClean(user)
                end

            local function leave_carwash(user)
                vRP.EXT.Base.remote._notify(user.source, cfg.lang.goodbye)
            end

        local ment = clone(gcfg.map_entity)
        ment[2].title = self.cfg.lang.title
        ment[2].pos = {x,y,z-1}
        vRP.EXT.Map.remote._addEntity(user.source, ment[1], ment[2])
        user:setArea("vRP:carwash" .. k, x, y, z, 3, 1.5, enter_carwash, leave_carwash)

    end
end
    end
end

vRP:registerExtension(CarWash)
