--[[---------------------------------------------------------
	Icons made by: 
	Freepik from www.flaticon.com 
	Licensed under: CC BY 3.0;

	Icon Download
-----------------------------------------------------------]]

include("sh_config.lua")

if SERVER then

	if GoldenHUDV3.WorkShopDL then
		resource.AddWorkshop("2608715273")
	end

	Msg( "\n" )
	Msg( "\n" )
	Msg( "///////////////////////////////////\n" )
	Msg( "//     Golden Hud V3 Library     //\n" )
	Msg( "///////////////////////////////////\n" )
	Msg( "// Loading...                    //\n" )
	Msg( "//  goldenhudv3/sh_config.lua    //\n" )
	AddCSLuaFile( "sh_config.lua" )
	Msg( "// Load Complete!                //\n" )
	Msg( "// Loading...                    //\n" )
	Msg( "//  goldenhudv3/cl_init.lua      //\n" )
	AddCSLuaFile( "cl/cl_init.lua" )
	Msg( "// Load Complete!                //\n" )
	Msg( "// Loading...                    //\n" )
	Msg( "//  goldenhudv3/cl_font.lua      //\n" )
	AddCSLuaFile( "cl/cl_font.lua" )
	Msg( "// Load Complete!                //\n" )
	Msg( "// Loading...                    //\n" )
	Msg( "//  goldenhudv3/cl_lockdown.lua  //\n" )
	AddCSLuaFile( "cl/cl_lockdown.lua" )
	Msg( "// Load Complete!                //\n" )
	Msg( "// Loading...                    //\n" )
	Msg( "//  goldenhudv3/cl_props.lua     //\n" )
	AddCSLuaFile( "cl/cl_props.lua" )
	Msg( "// Load Complete!                //\n" )
	Msg( "// Loading...                    //\n" )
	Msg( "//  goldenhudv3/cl_agenda.lua    //\n" )
	AddCSLuaFile( "cl/cl_agenda.lua" )
	Msg( "// Load Complete!                //\n" )
	Msg( "///////////////////////////////////\n" )
	Msg( "\n" )
	Msg( "\n" )

	if GoldenHUDV3.FastDL then
		resource.AddFile("materials/golden_hud_v3/water-bottle.png")
		resource.AddFile("materials/golden_hud_v3/surface.png")
		resource.AddFile("materials/golden_hud_v3/heart.png")
		resource.AddFile("materials/golden_hud_v3/shield.png")
		resource.AddFile("materials/golden_hud_v3/hamburger.png")
		resource.AddFile("materials/golden_hud_v3/ammo.png")
		resource.AddFile("materials/golden_hud_v3/gun.png")
		resource.AddFile("resource/fonts/BeVietnamPro-SemiBoldItalic.ttf")
		resource.AddFile("materials/golden_hud_v3/home.png")
		resource.AddFile("materials/golden_hud_v3/contact.png")
	end

elseif CLIENT then

	include( "cl/cl_init.lua" )
	include( "cl/cl_font.lua" )
	include( "cl/cl_lockdown.lua" )
	include( "cl/cl_props.lua" )
	include( "cl/cl_agenda.lua" )

end
