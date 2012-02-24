-- SCAR-L
-- By NinjaTuna (see credits.txt for more)

if SERVER then

	AddCSLuaFile("shared.lua")
	SWEP.HoldType = "ar2"
	
end

if CLIENT then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false -- Crosshairs are for wimps.
	SWEP.ViewModelFOV		= 60
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
		
	SWEP.Slot				= 2
	SWEP.SlotPos			= 1
	SWEP.WepSelectIcon		= surface.GetTextureID( "VGUI/entities/weapon_bb_scarl_killicon" )
	killicon.Add("weapon_bb_scarl" ,"VGUI/entities/weapon_bb_scarl_killicon" ,Color(255, 80, 0, 255))
	
end

SWEP.Base			= "blackbox_base"

SWEP.PrintName		= "FN SCAR-L"	
SWEP.Author			= "BlackBox - NinjaTuna"
SWEP.Instructions	= "Hold your use key and press secondary fire to change fire modes."

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.Weight				= 3.6
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/scarl/scarl-1.wav")
SWEP.Primary.Damage			= 20 -- This determines both the damage dealt and force applied by the bullet.
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Ammo			= "ar2"
SWEP.AutoRPM				= "625"

SWEP.ViewModel  			= "models/weapons/v_rif_scarl.mdl"
SWEP.WorldModel 			= "models/weapons/w_rif_scarl.mdl"
SWEP.MuzzleAttachment		= "1" -- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment	= "2" -- Should be "2" for CSS models or "1" for hl2 models