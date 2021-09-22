local y = 20
local homeicon = Material( "golden_hud_v3/home.png" )

hook.Add("HUDPaint", "GoldenHudV3.lockdown", function()
	if GoldenHUDV3.EnableLockdown then
    	if GetGlobalBool("DarkRP_LockDown") then
        	local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "DarkRP_LockdownHUD")
        	if shouldDraw == false or !DarkRP then return end

        	draw.RoundedBox(0, ScrW() / 2 - 272.5 , y, 545, 40, GoldenHUDV3.BackgroundColor)

        	draw.RoundedBox(0, ScrW() / 2 - 268 , y + 5, 30, 30, GoldenHUDV3.HeaderColor)
			draw.RoundedBox(0, ScrW() / 2 - 233 , y + 5, 500, 30, GoldenHUDV3.HeaderColor)

        	draw.DrawNonParsedText(DarkRP.getPhrase("lockdown_started"), "GoldenHudV3Font", ScrW() / 2 - 228, y + 6, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT)

        	surface.SetMaterial( homeicon )
		    surface.SetDrawColor(GoldenHUDV3.IconColor)
			surface.DrawTexturedRect( ScrW() / 2 - 264, y + 9, 22, 22 )
    	end
    end
end)