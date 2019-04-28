Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")


local cvRP = module("vrp", "client/vRP")
vRP = cvRP() 

local CarWash = class("CarWash", vRP.Extension)

function CarWash:__construct()
  vRP.Extension.__construct(self)
end

function CarWash:cleanVehicle()
	SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false), 0.0)
	SetVehicleUndriveable(GetVehiclePedIsIn(GetPlayerPed(-1),false), false)
end

function CarWash:getDirtLevel()
	return GetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1),false))
end

function CarWash:isInAnyVehicle()
  local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
  if veh then
    local driver = GetPedInVehicleSeat(veh, -1)
    if driver == GetPlayerPed(-1) then
      return true
    end
  end
  return false
end

CarWash.tunnel = {}
CarWash.tunnel.cleanVehicle = CarWash.cleanVehicle
CarWash.tunnel.getDirtLevel = CarWash.getDirtLevel
CarWash.tunnel.isInAnyVehicle = CarWash.isInAnyVehicle


vRP:registerExtension(CarWash)
