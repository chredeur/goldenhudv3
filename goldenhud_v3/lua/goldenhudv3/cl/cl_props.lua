local ply, wep
local gunicon = Material( "golden_hud_v3/gun.png" )
local surfaceicon = Material( "golden_hud_v3/surface.png" )
local weapon_props = {
	"weapon_physgun",
	"gmod_tool",
	"weapon_physcannon"
}
hook.Add("HUDPaint","GoldenHudV3.HudProps",function()
	if GoldenHUDV3.PropsHUD == false then return end

	ply = LocalPlayer()
	if ply:InVehicle() then return end

	local props = ply:GetCount("ragdolls") + ply:GetCount("props") + ply:GetCount("effects")

	if !IsValid(ply:GetActiveWeapon()) then return end

	wep = ply:GetActiveWeapon()
	if table.HasValue( weapon_props, wep:GetClass() ) then
		nicename = wep:GetPrintName()
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

		surface.SetMaterial( surfaceicon )
	    surface.SetDrawColor(GoldenHUDV3.IconColor)
		surface.DrawTexturedRect( ScrW() - 263, ScrH() - 42, 22, 22 )

		draw.SimpleText( GoldenHUDV3.Language[ GoldenHUDV3.ConfigLanguage ][ "props" ].." "..props, "GoldenHudV3Font", ScrW() - 222, ScrH() - 43, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT )
	end

end)