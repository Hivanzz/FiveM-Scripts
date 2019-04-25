-- Coded by Hivan --
--- For FiveM ---
---- Forum ----
--- @Hivan - @Hivanzh --

-- config --

-- props, radius --


prop = {
  {"prop_wheelchair_01", 1.5},
  {"prop_atm_01", 1.5}
}

-- Script --

Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  for i = 1, #prop do
    prop2 = prop[i] 
    x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    if DoesObjectOfTypeExistAtCoords(x,y,z, prop2[2], prop2[1], 0) then -- If distance (player - coords) < of radius then
  	DisableControlAction(0,22,true) -- Space for Jump
	propst = GetHashKey(prop2[1])
    r = prop2[2]
  end
  end
end
end)

Citizen.CreateThread(function()
while true do
  Citizen.Wait(100) 
  if propst then
  for i = 1, #prop do
    prop2 = prop[i] 
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    if DoesObjectOfTypeExistAtCoords(x,y,z, r, propst, 0) then -- If distance (player - coords) < of radius then
  	if not notified then
   SendNotification("~r~Jump disabled")
   notified = true
  end
  else
if notified then
SendNotification("~g~Jump enabled")
notified = nil
propst = nil
r = 0
 end
end
end
end
end
end)

-- do not touch --

-- prop --

propst = nil
r = nil 

-- fct --

notified = nil

-- General --

function SendNotification(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end
