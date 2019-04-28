local vRPNoCarjack = class("vRPNoCarjack", vRP.Extension)


function vRPNoCarjack:__construct()
    vRP.Extension.__construct(self)
end

local vehicles = {}

vRPNoCarjack.tunnel = {}

function vRPNoCarjack.tunnel:setVehicleDoorsForEveryone(veh, doors, plate)
    if not vehicles[plate] then
        local user = vRP.users_by_source[source]
		
            local identity = vRP.EXT.Identity:getIdentity(user.source)
            if identity then
                local user_plate = "P " .. identity.registration

                if user_plate ~= plate then
                    for id, user in pairs(vRP.users) do
                        self.remote.setVehicleDoors(id, veh, doors)
                    end
                end

                vehicles[plate] = true
            end
        end
    end

vRP:registerExtension(vRPNoCarjack)