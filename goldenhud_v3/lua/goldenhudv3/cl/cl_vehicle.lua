local y = ScrW() - 273
local x = ScrH() - 50

local fuel = 0
local fuelmax = 0
local health = 0

local mphtext, speed

local speedometericon = Material( "golden_hud_v3/speedometer.png" )
local fuelicon = Material( "golden_hud_v3/fuel.png" )
local engineicon = Material( "golden_hud_v3/engine.png" )
local caricon = Material( "golden_hud_v3/car.png" )

hook.Add("HUDPaint", "GoldenHudV3.Vehicle", function()
	if GoldenHUDV3.VehicleEnable == false && GoldenHUDV3.SpeedometerHud == false then return end

	local colorhealth = Color(255, 255, 255, 255)
	local colorfuel = Color(255, 255, 255, 255)

	local speedy = 0
	local vehicley = 0
	local vehicley2 = 0

	local boxsize = 40
	local boxspeedy = 0
	local boxvehicley = 0

	local ply = LocalPlayer()
	
	if not ply:InVehicle() then return end
	if GoldenHUDV3.VehicleEnable && GoldenHUDV3.Vehicle == "svmod" && SVMOD:GetAddonState() then hook.Remove("HUDPaint", "SV_HUDPaint") end

	local veh = ply:GetVehicle()
	local vehs = ply:GetVehicle()

	if veh:GetDriver() == NULL then return end
	if veh:GetClass() == "prop_vehicle_prisoner_pod" then
		veh = veh:GetParent()
		if not IsValid(veh) then return end
	end

	if vehs:GetClass() == "prop_vehicle_prisoner_pod" then return end

	if GoldenHUDV3.VehicleEnable && GoldenHUDV3.Vehicle == "svmod" && SVMOD:GetAddonState() && SVMOD:IsVehicle(LocalPlayer():GetVehicle()) then
		if not SVMOD:IsVehicle(vehs) then return end
		fuel = math.Round(vehs:SV_GetFuel())
		fuelmax = vehs:SV_GetMaxFuel()
		health = math.Round(vehs:SV_GetHealth())
		boxsize = boxsize + 70
		boxvehicley = boxvehicley + 70
		vehicley = vehicley + 35
		vehicley2 = vehicley2 + 35
	end

	if GoldenHUDV3.VehicleEnable && GoldenHUDV3.Vehicle == "vcmod" && VC then
		fuel = math.Round(vehs:VC_fuelGet(false))
		fuelmax = vehs:VC_fuelGetMax()
		health = math.Round(vehs:VC_getHealth(true))
		boxsize = boxsize + 70
		boxvehicley = boxvehicley + 70
		vehicley = vehicley + 35
		vehicley2 = vehicley2 + 35
	end

	if GoldenHUDV3.SpeedometerHud then
		boxsize = boxsize + 35
		boxspeedy = boxspeedy + 35
		speedy = speedy + 35
	end

	if health < 50 then
		colorhealth = Color(209, 162, 72, 255)
	end

	if health < 20 then
		colorhealth = Color(217, 47, 47, 255)
	end

	if fuel < 6 then
		colorfuel = Color(217, 47, 47, 255)
	end

	draw.RoundedBox(0, y, x - boxvehicley - boxspeedy, 258, boxsize, GoldenHUDV3.BackgroundColor)

	draw.RoundedBox(0, y + 5 , x + 5 - vehicley - vehicley2 - speedy, 30, 30, GoldenHUDV3.HeaderColor)
	draw.RoundedBox(0, y + 42, x + 5 - vehicley - vehicley2 - speedy, 210, 30, GoldenHUDV3.HeaderColor)

	local vehname = list.Get( "Vehicles" )[ vehs:GetVehicleClass() ]

	vehname = vehname.Name

	if string.len(vehname) > 23 then vehname = string.Left( vehname, 22 ) .. "..." end

	draw.SimpleText(vehname, "GoldenHudV3Font", y + 49, x + 6 - vehicley - vehicley2 - speedy, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT)

	surface.SetMaterial( caricon )
    surface.SetDrawColor(GoldenHUDV3.IconColor) 
	surface.DrawTexturedRect( y + 9 , x + 8 - vehicley - vehicley2 - speedy, 22, 22 )

	if GoldenHUDV3.SpeedometerHud then

		if GoldenHUDV3.MPHCounter then
			speed = math.floor(vehs:GetVelocity():Length() * 0.0568188)
			mphtext = "MPH"
		else
			speed = math.floor(vehs:GetVelocity():Length() * 0.09144)
			mphtext = "KM/H"
		end

		if speed < 10 then speed = "0" .. speed end
		draw.RoundedBox(0, y + 5 , x + 5 - vehicley - vehicley2, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, y + 42, x + 5 - vehicley - vehicley2, 210, 30, GoldenHUDV3.HeaderColor)

		draw.SimpleText(speed.." "..mphtext, "GoldenHudV3Font", y + 49, x + 6 - vehicley - vehicley2, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT)

		surface.SetMaterial( speedometericon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor) 
		surface.DrawTexturedRect( y + 9 , x + 8 - vehicley - vehicley2, 22, 22 )
	end

	if GoldenHUDV3.VehicleEnable && GoldenHUDV3.Vehicle == "vcmod" or GoldenHUDV3.VehicleEnable && GoldenHUDV3.Vehicle == "svmod" then

		draw.RoundedBox(0, y + 5 , x + 5 - vehicley2, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, y + 42, x + 5  - vehicley2, 210, 30, GoldenHUDV3.HeaderColor)

		draw.SimpleText(health.."%", "GoldenHudV3Font", y + 49, x + 6  - vehicley2, colorhealth, TEXT_ALIGN_LEFT)

		surface.SetMaterial( engineicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor) 
		surface.DrawTexturedRect( y + 9 , x + 8  - vehicley2, 22, 22 )

		draw.RoundedBox(0, y + 5 , x + 5, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, y + 42, x + 5, 210, 30, GoldenHUDV3.HeaderColor)

		draw.SimpleText(fuel.."/"..fuelmax.." l", "GoldenHudV3Font", y + 49, x + 6, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT)

		surface.SetMaterial( fuelicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor) 
		surface.DrawTexturedRect( y + 9 , x + 8, 22, 22 )
	end
end)