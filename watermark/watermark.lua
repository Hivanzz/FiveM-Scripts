-- Coded by Hivan --
--- For FiveM Forum ---
---- Life ----
--- Italia --

-- Original script: https://forum.fivem.net/t/release-simple-watermark/7140 --

base = "[Home]"

full = "Discord: discord || Web: web"

control = 212

offset = {x = 0.005, y = 0.001}

rgb = {r = 64, g = 64, b = 64}

alpha = 255

scale = 0.5

font = 4

bringontherainbows = true

Citizen.CreateThread(function()
	while true do
		Wait(1)

		if bringontherainbows then
			rgb = RGBRainbow(3)
		end
		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)

		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		if IsControlPressed(1, control) then -- If is pressed Control 
		AddTextComponentString(full) -- Display Full version
		else
		AddTextComponentString(base) -- Display Base Version
		end
		DrawText(offset.x, offset.y)
	end
end)

function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end