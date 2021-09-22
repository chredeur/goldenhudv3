local x = ScrH() * 0.01
local y = 10
local calendriericon = Material( "golden_hud_v3/contact.png" )
hook.Add("HUDPaint", "GoldenHudV3.HudAgenda", function()
    if GoldenHUDV3.EnableAgenda then
        local shouldDraw = hook.Call("HUDShouldDraw", GAMEMODE, "GoldenHudV3.Hud.Agenda")
        if shouldDraw == false or !DarkRP then return end

        local ply = LocalPlayer()

        local agenda = ply:getAgendaTable()
        if not agenda then return end
        local agendaText = DarkRP.textWrap((ply:getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "GoldenHudV3Font", 390)

        draw.RoundedBox(0, y, x, 410, 200, GoldenHUDV3.BackgroundColor)

        draw.RoundedBox(0, y + 5, x + 5, 30, 30, GoldenHUDV3.HeaderColor)
        draw.RoundedBox(0, y + 40, x + 5, 364, 30, GoldenHUDV3.HeaderColor)

        draw.RoundedBox(0, y + 5, x + 39, 399, 156, GoldenHUDV3.HeaderColor)

        surface.SetMaterial( calendriericon )
        surface.SetDrawColor(GoldenHUDV3.IconColor)
        surface.DrawTexturedRect( y + 9, x + 8, 22, 22 )

        draw.DrawNonParsedText(agenda.Title, "GoldenHudV3Font", x + 46, y + 6, GoldenHUDV3.HeaderTextColor, 0)
        draw.DrawNonParsedText(agendaText, "GoldenHudV3Font", x + 13, y + 40, GoldenHUDV3.HeaderTextColor, 0)
    end
end)