/*#################################################

###          GoldenHUDV3 By chredeur            ###

#################################################*/

local vehiclehide = false if GoldenHUDV3.VehicleEnable == true && GoldenHUDV3.Vehicle == "vcmod" then vehiclehide = true end

local HideElementsTable = {
	["DarkRP_HUD"] = true,
	["DarkRP_ArrestedHUD"] = false,
	["DarkRP_EntityDisplay"] = false,
	["DarkRP_ZombieInfo"] = true,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Hungermod"] = true,
	["DarkRP_Agenda"] = true,
	 
	["CHudHealth"] = GoldenHUDV3.EnableAmmoBar,
	["CHudBattery"] = GoldenHUDV3.EnableAmmoBar,
	["CHudSuitPower"] = GoldenHUDV3.EnableAmmoBar,
    ["CHudAmmo"] = GoldenHUDV3.EnableAmmoBar,
    ["CHudSecondaryAmmo"] = GoldenHUDV3.EnableAmmoBar,

    ["CHudCrosshair"] = false,

    ["Cookingmod_Hunger"] = GoldenHUDV3.EnableCompatibilityACM,
	["Cookingmod_Thirst"] = GoldenHUDV3.EnableCompatibilityACM,

	["MedicMod_HUD"] = false,
	["MedicMod_DeathPanel"] = false,

	["VCMod_Health"] = vehiclehide,
	["VCMod_Damage"] = vehiclehide,
	["VCMod_ELS_Lights"] = vehiclehide,
	["VCMod_ELS_Siren"] = vehiclehide, 
	["VCMod_Fuel"] = vehiclehide,
	["VCMod_Name"] = vehiclehide,
	["VCMod_Icons"] = vehiclehide,
}

local hearticon = Material( "golden_hud_v3/heart.png" )
local foodicon = Material( "golden_hud_v3/hamburger.png" )
local armoricon = Material( "golden_hud_v3/shield.png" )
local thirsticon = Material( "golden_hud_v3/water-bottle.png" )
local ammoicon = Material( "golden_hud_v3/ammo.png" )
local gunicon = Material( "golden_hud_v3/gun.png" )
local moneyicon = Material( "golden_hud_v3/money.png" )

local health = 0
local armor = 0
local food = 0
local thirst = 0
local salary, money
hook.Add("HUDPaint","GoldenHudV3", function()

	local ply = LocalPlayer()

	local armory = 0
	local foody = 0
	local thirsty = 0
	local moneyy = 0

	local boxsize = 40
	local boxfoody = 0
	local boxarmor = 0
	local boxthirst = 0
	local boxmoney = 0

	health = Lerp( FrameTime(), health, ply:Health())

	-- Confif Check Armor --
	if GoldenHUDV3.ArmorBar then
		armor = Lerp( FrameTime(), armor, ply:Armor())
		armory = 35
		boxsize = boxsize + 35
		boxarmor = 35
	end

	-- Confif Check Food --
	if GoldenHUDV3.FoodBar then
		food = Lerp( FrameTime(), food, ply:getDarkRPVar("Energy") or 0)
		foody = 35
		boxsize = boxsize + 35
		boxfoody = 35
	end

	-- Config Check Thirst --
	if GoldenHUDV3.EnableCompatibilityACM then
		thirst = Lerp( FrameTime(), thirst, ply:getDarkRPVar("Thirst") or 0)
		thirsty = 35
		boxsize = boxsize + 35
		boxthirst = 35
	end

	-- Config Check Money --
	if GoldenHUDV3.MoneyBar then
		salary = DarkRP.formatMoney(ply:getDarkRPVar("salary"))
		money = DarkRP.formatMoney(ply:getDarkRPVar("money"))
		moneyy = 35
		boxsize = boxsize + 35
		boxmoney = 35
	end

	-- Background --
	draw.RoundedBox(0, 10, ScrH() - 50 - boxarmor - boxfoody - boxthirst - boxmoney, 360, boxsize, GoldenHUDV3.BackgroundColor)

	-- Health --
	draw.RoundedBox(0, 14, ScrH() - 45 - armory - foody - thirsty - moneyy, 30, 30, GoldenHUDV3.HeaderColor)
	draw.RoundedBox(0, 50, ScrH() - 45 - armory - foody - thirsty - moneyy, 316, 30, GoldenHUDV3.HeaderColor)
	draw.RoundedBox(5, 55, ScrH() - 40.55 - armory - foody - thirsty - moneyy, 306, 21, GoldenHUDV3.BackgroundHealthColor)
	draw.RoundedBox(5, 55, ScrH() - 40.55 - armory - foody - thirsty - moneyy, math.Clamp(health, 0, 100) * 3.06, 21, GoldenHUDV3.HealthColor)

	draw.SimpleText(math.Round(health).."%", "GoldenHudV3Font", 202, ScrH() - 44 - armory - foody - thirsty - moneyy, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_CENTER)

	surface.SetMaterial( hearticon )
    surface.SetDrawColor(GoldenHUDV3.IconColor)
	surface.DrawTexturedRect( 18, ScrH() - 41 - armory - foody - thirsty - moneyy, 22, 22 )

	-- Armor --
	if GoldenHUDV3.ArmorBar then
		draw.RoundedBox(0, 14, ScrH() - 45 - foody - thirsty - moneyy, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, 50, ScrH() - 45 - foody - thirsty - moneyy, 316, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55 - foody - thirsty - moneyy, 306, 21, GoldenHUDV3.BackgroundArmorColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55 - foody - thirsty - moneyy, math.Clamp(armor, 0, 100) * 3.06, 21, GoldenHUDV3.ArmorColor)

		draw.SimpleText(math.Round(armor).."%", "GoldenHudV3Font", 202, ScrH() - 44 - foody - thirsty - moneyy, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_CENTER)

		surface.SetMaterial( armoricon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( 18, ScrH() - 41 - foody - thirsty - moneyy, 22, 22 )
	end

	-- Food --
	if GoldenHUDV3.FoodBar then
		draw.RoundedBox(0, 14, ScrH() - 45 - thirsty - moneyy, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, 50, ScrH() - 45 - thirsty - moneyy, 316, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55 - thirsty - moneyy, 306, 21, GoldenHUDV3.BackgroundFoodColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55 - thirsty - moneyy, math.Clamp(food, 0, 100) * 3.06, 21, GoldenHUDV3.FoodColor)

		draw.SimpleText(math.Round(food).."%", "GoldenHudV3Font", 202, ScrH() - 44 - thirsty - moneyy, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_CENTER)

		surface.SetMaterial( foodicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( 18, ScrH() - 41 - thirsty - moneyy, 22, 22 )
	end

	-- Thirst --
	if GoldenHUDV3.EnableCompatibilityACM then
		draw.RoundedBox(0, 14, ScrH() - 45 - moneyy, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, 50, ScrH() - 45 - moneyy, 316, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55 - moneyy, 306, 21, GoldenHUDV3.BackgroundThirstColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55 - moneyy, math.Clamp(thirst, 0, 100) * 3.06, 21, GoldenHUDV3.ThirstColor)

		draw.SimpleText(math.Round(thirst).."%", "GoldenHudV3Font", 202, ScrH() - 44 - moneyy, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_CENTER)

		surface.SetMaterial( thirsticon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( 18, ScrH() - 41 - moneyy, 22, 22 )
	end

	-- Money --
	if GoldenHUDV3.MoneyBar then
		draw.RoundedBox(0, 14, ScrH() - 45, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, 50, ScrH() - 45, 316, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(5, 55, ScrH() - 40.55, 306, 21, GoldenHUDV3.MoneyColor)

		draw.SimpleText(money, "GoldenHudV3Font", 202, ScrH() - 43, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_CENTER)

		surface.SetMaterial( moneyicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( 18, ScrH() - 41, 22, 22 )
	end

end )

hook.Add("HUDPaint","GoldenHudV3.Ammo", function()
	-- Ammo --
	if GoldenHUDV3.EnableAmmoBar then

		local ply = LocalPlayer()
		if ply:InVehicle() then return end

		if !IsValid(ply:GetActiveWeapon()) then return end

		wep = ply:GetActiveWeapon()
		total = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
		clip = wep:Clip1()
		nicename = wep:GetPrintName()

		if clip < 0 or table.HasValue( GoldenHUDV3.BlackListWeapon or "weapon_physcannon", wep:GetClass() ) then return end
		if string.len(nicename) > 25 then nicename = string.Left( nicename, 20 ) .. "..." end

		-- Background --
		draw.RoundedBox(0, ScrW() - 273 , ScrH() - 85, 260, 75, GoldenHUDV3.BackgroundColor)

		-- Weapons Name --
		draw.RoundedBox(0, ScrW() - 267, ScrH() - 80, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, ScrW() - 230, ScrH() - 80, 210, 30, GoldenHUDV3.HeaderColor)

		surface.SetMaterial( gunicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( ScrW() - 263, ScrH() - 77, 22, 22 )

		draw.SimpleText( nicename, "GoldenHudV3Font", ScrW() - 222, ScrH() - 77, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT ) 

		-- Weapons Ammo --
		draw.RoundedBox(0, ScrW() - 267, ScrH() - 45, 30, 30, GoldenHUDV3.HeaderColor)
		draw.RoundedBox(0, ScrW() - 230, ScrH() - 45, 210, 30, GoldenHUDV3.HeaderColor)

		surface.SetMaterial( ammoicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( ScrW() - 263, ScrH() - 42, 22, 22 )

		draw.SimpleText( clip.."/"..total, "GoldenHudV3Font", ScrW() - 222, ScrH() - 43, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT )

	end
end )

local function HideElements( element )
	if HideElementsTable[ element ] then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )

hook.Add( "HUDDrawTargetID", "ByeTargetIdHUD", function()
    return false
end )