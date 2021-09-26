local ScreenPos = ScrH() - 200

local Colors = {}
Colors[ NOTIFY_GENERIC ] = Color( 255, 255, 255 )
Colors[ NOTIFY_ERROR ] = Color( 255, 255, 43 )
Colors[ NOTIFY_UNDO ] = Color( 255, 255, 255 )
Colors[ NOTIFY_HINT ] = Color( 255, 255, 255 )
Colors[ NOTIFY_CLEANUP ] = Color( 255, 255, 255 )

local LoadingColor = GoldenHUDV3.IconColor

local Icons = {}
Icons[ NOTIFY_GENERIC ] = Material( "golden_hud_v3/generic.png" )
Icons[ NOTIFY_ERROR ] = Material( "golden_hud_v3/error.png" )
Icons[ NOTIFY_UNDO ] = Material( "golden_hud_v3/undo.png" )
Icons[ NOTIFY_HINT ] = Material( "golden_hud_v3/hint.png" )
Icons[ NOTIFY_CLEANUP ] = Material( "golden_hud_v3/cleanup.png" )

local LoadingIcon = Material( "golden_hud_v3/loading.png" )

local Notifications = {}

local function DrawNotification( x, y, w, h, text, icon, col, progress )
	draw.RoundedBox( 0, x - 45, y - 5, w + 16, h + 7, GoldenHUDV3.BackgroundColor )
	draw.RoundedBox( 0, x - 4, y, w - 31, h - 2, GoldenHUDV3.HeaderColor )
	draw.RoundedBox(0, x - 40, y, 30, 30, GoldenHUDV3.HeaderColor)

	draw.SimpleText( text, "GoldenHudV3Font", x + 5, y + h / 2 - 3, GoldenHUDV3.HeaderTextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

	surface.SetDrawColor( GoldenHUDV3.IconColor )
	surface.SetMaterial( icon )

	if progress then
		surface.DrawTexturedRectRotated( x - 25, y + h / 2, 22, 22, -CurTime() * 360 % 360 )
	else
		surface.DrawTexturedRect( x - 36, y + 4, 22, 22 )
	end
end

function notification.AddLegacy( text, type, time )
	surface.SetFont( "GoldenHudV3Font" )

	local w = surface.GetTextSize( text ) + 20 + 32
	local h = 32
	local x = ScrW()
	local y = ScreenPos

	table.insert( Notifications, 1, {
		x = x,
		y = y,
		w = w,
		h = h,

		text = text,
		col = Colors[ type ],
		icon = Icons[ type ],
		time = CurTime() + time,

		progress = nil,
	} )
end

function notification.AddProgress( id, text, frac )
	for k, v in ipairs( Notifications ) do
		if v.id == id then
			v.text = text
			v.progress = frac
			
			return
		end
	end

	surface.SetFont( "GoldenHudV3Font" )

	local w = surface.GetTextSize( text ) + 20 + 32
	local h = 32
	local x = ScrW()
	local y = ScreenPos

	table.insert( Notifications, 1, {
		x = x,
		y = y,
		w = w,
		h = h,

		id = id,
		text = text,
		col = LoadingColor,
		icon = LoadingIcon,
		time = math.huge,

		progress = math.Clamp( frac or 0, 0, 1 ),
	} )	
end

function notification.Kill( id )
	for k, v in ipairs( Notifications ) do
		if v.id == id then v.time = 0 end
	end
end

hook.Add( "HUDPaint", "DrawNotifications", function()
	for k, v in ipairs( Notifications ) do
		DrawNotification( math.floor( v.x ), math.floor( v.y ), v.w, v.h, v.text, v.icon, v.col, v.progress )

		v.x = Lerp( FrameTime() * 10, v.x, v.time > CurTime() and ScrW() - v.w - 10 or ScrW() + 30 )
		v.y = Lerp( FrameTime() * 10, v.y, ScreenPos - ( k - 1 ) * ( v.h + 10 ) )
	end

	for k, v in ipairs( Notifications ) do
		if v.x >= ScrW() and v.time < CurTime() then
			table.remove( Notifications, k )
		end
	end
end )
