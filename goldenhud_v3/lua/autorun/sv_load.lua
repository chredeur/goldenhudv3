AddCSLuaFile( 'goldenhudv3/sh_config.lua' )
AddCSLuaFile( 'goldenhudv3/sh_initialize.lua' )

include( 'goldenhudv3/sh_initialize.lua' )
Msg( "[goldenhudv3] sh_initialize.lua load !\n" )


local GoldenV1Version = "1.2" -- NEVER TOUCH THIS!

if SERVER then
	util.AddNetworkString( "goldenhudv3version" )

	hook.Add( "PlayerInitialSpawn", "GoldenHudV3.Version", function(ply)
		timer.Simple(5, function()
			if !IsValid(ply) then return end
			net.Start("goldenhudv3version") 
			net.Send(ply)
			if !ply:IsSuperAdmin() then return end
			http.Fetch( "https://raw.githubusercontent.com/chredeur0/goldenhud-etc/main/goldenhudv3-version.txt", function( body, len, headers, code )
				local GoldenReceive = string.gsub( body, "\n", "" )
				if (GoldenReceive != "400: Invalid request") and (GoldenReceive != "404: Not Found") and (GoldenReceive != GoldenV1Version) then 
					ply:ChatPrint( GoldenHUDV3.Language[ GoldenHUDV3.ConfigLanguage ][ "version_1" ] ..GoldenV1Version.. GoldenHUDV3.Language[ GoldenHUDV3.ConfigLanguage ][ "version_2" ] ..GoldenReceive )
				end
			end,
			function( error )
			print("GoldenHudV3 HTTP (error) : " , error)
			end)
		end)
	end)
end