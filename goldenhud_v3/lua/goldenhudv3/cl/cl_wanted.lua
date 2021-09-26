local eyeicon = Material( "golden_hud_v3/eye.png" )
hook.Add("HUDPaint", "GoldenHudV3.wanted", function()
	local wanted = LocalPlayer():getDarkRPVar( "wanted" )
	if wanted and GoldenHUDV3.EnableWanted then
        local y = ScrW() / 2
        local x = ScrH() - 50

        draw.RoundedBox(0, ScrW() / 2 - 200 , x, 345, 40, GoldenHUDV3.BackgroundColor)

        draw.RoundedBox(0, ScrW() / 2 - 195 , x + 5, 30, 30, GoldenHUDV3.HeaderColor)
        draw.RoundedBox(0, ScrW() / 2 - 160 , x + 5, 300, 30, GoldenHUDV3.HeaderColor)

        draw.SimpleText(GoldenHUDV3.Language[ GoldenHUDV3.ConfigLanguage ][ "wanted" ], "GoldenHudV3Font", ScrW() / 2 - 155, y + 77, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT)

        surface.SetMaterial( eyeicon )
        surface.SetDrawColor(GoldenHUDV3.IconColor) 
        surface.DrawTexturedRect( ScrW() / 2 - 191, y + 79, 22, 22 )

    end
end)