/*#################################################
###												###
###          GoldenHUDV3 config file            ###
###				    By chredeur					###
#################################################*/

GoldenHUDV3 = GoldenHUDV3 or {}

-- FastDL --
GoldenHUDV3.FastDL = true -- Activate disable the FastDL

-- WorkShopDL --
GoldenHUDV3.WorkShopDL = true -- Activate disable the WorkShopDL

-- Language --
GoldenHUDV3.ConfigLanguage = "en" -- en, fr 

-- Hud Bar --
GoldenHUDV3.ArmorBar = true -- Activate disable armor bar
GoldenHUDV3.FoodBar = true -- Activate deactivate the food bar

-- Compatibility Advanced Cooking Mod --
GoldenHUDV3.EnableCompatibilityACM = false -- Activate disable the Compatibility Advanced Cooking Mod

-- Speedometer Hud --
GoldenHUDV3.SpeedometerHud = true -- Activate disable the Speedometer Hud
GoldenHUDV3.MPHCounter = true -- true = MPH system / false = KM/H system
GoldenHUDV3.SpeedometerBackgroundColor = Color(0, 0, 0, 225) -- Change the color of the Background

-- Vehicle System --
GoldenHUDV3.VehicleEnable = false -- Activate disable the Vehicle System
GoldenHUDV3.Vehicle = "vcmod" -- "vcmod" or "svmod"

-- Wanted --
GoldenHUDV3.EnableWanted = true -- Activate disable the Wanted Hud

-- Notification --
GoldenHUDV3.EnableNotif = true -- Activate disable the Notification

-- Props Hud --
GoldenHUDV3.PropsHUD = true -- Activate disable the Props Hud

-- Lockdown --
GoldenHUDV3.EnableLockdown = true -- Activate disable the Lockdown

-- Agenda --
GoldenHUDV3.EnableAgenda = true -- Activate disable the Agenda

-- Ammo Bar --
GoldenHUDV3.EnableAmmoBar = true -- Activate disable ammo bar
GoldenHUDV3.BlackListWeapon = { -- Blacklist the weapon
	"weapon_keypadchecker",
	"weapon_physcannon",
	"weapon_bugbait",
	"weapon_slam",
	"sent_bong",
	"sent_messure", 
	"sent_sniffer", 	
	"sent_tablet",
	"pass_police_nationale_1"
}

-- Hud Color --
GoldenHUDV3.HeaderColor = Color(33, 31, 31, 255)
GoldenHUDV3.HeaderTextColor = Color(255, 255, 255, 255)
GoldenHUDV3.BackgroundColor = Color(0, 0, 0, 150)

GoldenHUDV3.HealthColor = Color(255, 100, 62, 150)
GoldenHUDV3.BackgroundHealthColor = Color(255, 100, 62, 50)

GoldenHUDV3.ArmorColor = Color(31, 126, 208, 150)
GoldenHUDV3.BackgroundArmorColor = Color(31, 126, 208, 50)

GoldenHUDV3.FoodColor = Color(1, 142, 8, 150)
GoldenHUDV3.BackgroundFoodColor = Color(1, 142, 8, 50)

GoldenHUDV3.ThirstColor = Color(74, 179, 242, 150)
GoldenHUDV3.BackgroundThirstColor = Color(74, 179, 242, 50)

GoldenHUDV3.IconColor = Color(255, 255, 255, 255)

-- Language --
GoldenHUDV3.Language = {
	["fr"] = {
		["wanted"] = "Vous êtes rechercher par la police",
		["props"] = "Objets:",
		["version_1"] = "[Alerte SuperAdmin GoldenHudV3] Version obsolète de GoldenHudV3, Version: ",
		["version_2"] = " , téléchargez la dernière version sur Github, Workshop ou mtxserv resources, Version: ",
	},
	["en"] = {
		["wanted"] = "You are wanted by police",
		["props"] = "Props:",
		["version_1"] = "[GoldenHudV3 SuperAdmin Alert] Obsolete version of Golden Hud V1, Version : ",
		["version_2"] = " , download the latest version on Github, Workshop or mtxserv resources, Version: ",
	}
}