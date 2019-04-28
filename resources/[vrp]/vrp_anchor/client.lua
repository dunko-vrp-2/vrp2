Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
local cvRP = module("vrp", "client/vRP")
vRP = cvRP()

local vRPAnchor = class("vRPAnchor", vRP.Extension)

local anchored = false

function vRPAnchor:__construct()
    vRP.Extension.__construct(self)
end

function vRPAnchor:isPedInAnyBoat()
    if IsPedInAnyBoat(GetPlayerPed(-1)) then
        return true
    else
        return false
    end
end

function vRPAnchor:anchor()
    local ped = GetPlayerPed(-1)
    boat = GetVehiclePedIsIn(ped, true)

    if not IsPedInAnyVehicle(ped) then
        if not anchored then
            SetBoatAnchor(boat, true)
        end
    end
end

function vRPAnchor:unanchor()
    local ped = GetPlayerPed(-1)
    boat = GetVehiclePedIsIn(ped, true)

    if anchored then
        SetBoatAnchor(boat, false)
        anchored = false
    end
end

vRPAnchor.tunnel = {}

vRPAnchor.tunnel.isPedInAnyBoat = vRPAnchor.isPedInAnyBoat
vRPAnchor.tunnel.anchor = vRPAnchor.anchor
vRPAnchor.tunnel.unanchor = vRPAnchor.unanchor

vRP:registerExtension(vRPAnchor)
