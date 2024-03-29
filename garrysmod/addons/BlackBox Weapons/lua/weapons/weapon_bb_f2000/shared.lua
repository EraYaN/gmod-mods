-- PP-2000
-- By NinjaTuna (see credits.txt for more)

if SERVER then

	AddCSLuaFile("shared.lua")
	
end

if CLIENT then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false -- Crosshairs are for wimps.
	SWEP.ViewModelFOV		= 60
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
		
	SWEP.Slot				= 2
	SWEP.SlotPos			= 1
	SWEP.WepSelectIcon		= surface.GetTextureID( "VGUI/entities/weapon_bb_f2000_icon" )
	killicon.Add("weapon_bb_f2000" ,"VGUI/entities/weapon_bb_f2000_icon" ,Color(255, 80, 0, 255))
	
end

SWEP.Base			= "bb_base"

------------
-- Info --
------------
SWEP.PrintName		= "FN F2000"	
SWEP.Author			= "BlackBox - NinjaTuna"
SWEP.Instructions	= "Hold your use key and press secondary fire to change fire modes."

-------------
-- Misc. --
-------------
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.Weight				= 3.6
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.HoldType 			= "ar2"


----------------------
-- Primary Fire --
----------------------
SWEP.Primary.Sound			= Sound("weapons/f2000/f2000-1.wav")
SWEP.Primary.Damage			= 16 -- This determines both the damage dealt and force applied by the bullet.
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 60
SWEP.Primary.Ammo			= "ar2"
SWEP.MuzzleVelocity			= 900 -- How fast the bullet travels in meters per second. For reference, an AK47 shoots at about 750, an M4 shoots at about 900, and a Luger 9mm shoots at about 350 (source: Wikipedia)
SWEP.FiresUnderwater 		= false


-------------------------
-- Secondary Fire --
-------------------------
-- Secondary Fire is used to switch ironsights and firemodes
SWEP.Secondary.ClipSize		= -1 -- best left at -1
SWEP.Secondary.DefaultClip	= 3 -- set to -1 if you don't use secondary ammo
SWEP.Secondary.Ammo			= "SMG1_Grenade" -- Leave this if you want your SWEP to have grenades, otherwise set to "none" if you don't use secondary ammo.


---------------------------------------
-- Recoil, Spread, and Spray --
---------------------------------------
SWEP.RecoverTime 	= 0.6 -- Time in seconds it takes the player to re-steady his aim after firing.

-- The following variables control the overall accuracy of the gun and typically increase with each shot
-- Recoil: how much the gun kicks back the player's view.
SWEP.MinRecoil		= 0.15
SWEP.MaxRecoil		= 0.5
SWEP.DeltaRecoil	= 0.15 -- The recoil to add each shot.  Same deal for spread and spray.

-- Spread: the width of the gun's firing cone.  More spread means less accuracy.
SWEP.MinSpread		= 0.002
SWEP.MaxSpread		= 0.015
SWEP.DeltaSpread	= 0.005

-- Spray: the gun's tendancy to point in random directions.  More spray means less control.
SWEP.MinSpray		= 0
SWEP.MaxSpray		= 0.1
SWEP.DeltaSpray		= 0.16


---------------------------
-- Ironsight/Scope --
---------------------------
-- IronSightsPos and IronSightsAng are model specific paramaters that tell the game where to move the weapon viewmodel in ironsight mode.
---------------------------
SWEP.IronSightsPos 			= Vector (4.3439, -5, 1.2058)
SWEP.IronSightsAng 			= Vector (0, 0, 0)
SWEP.IronSightZoom			= 1.6 -- How much the player's FOV should zoom in ironsight mode. 
SWEP.UseScope				= true -- Use a scope instead of iron sights.
SWEP.ScopeScale 			= 0.3 -- The scale of the scope's reticle in relation to the player's screen size.
SWEP.ScopeZooms				= {1.6} -- The possible magnification levels of the weapon's scope.   If the scope is already activated, secondary fire will cycle through each zoom level in the table.
SWEP.DrawParabolicSights	= false -- Set to true to draw a cool parabolic sight (helps with aiming over long distances)

-------------------------
-- Effects/Visual --
-------------------------
SWEP.ViewModel  			= "models/weapons/v_rif_f2000.mdl"
SWEP.WorldModel 			= "models/weapons/w_rif_f2000.mdl"
SWEP.MuzzleEffect			= "rg_muzzle_rifle" -- This is an extra muzzleflash effect
-- Available muzzle effects: rg_muzzle_grenade, rg_muzzle_highcal, rg_muzzle_hmg, rg_muzzle_pistol, rg_muzzle_rifle, rg_muzzle_silenced, none

SWEP.ShellEffect			= "none" -- This is a shell ejection effect
-- Available shell eject effects: rg_shelleject, rg_shelleject_rifle, rg_shelleject_shotgun, none. Most of our rifles already have shell ejection animations!!!

SWEP.MuzzleAttachment		= "1" -- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment	= "2" -- Should be "2" for CSS models or "1" for hl2 models


-------------------
-- Modifiers --
-------------------
-- Modifiers scale the gun's recoil, spread, and spray based on the player's stance
SWEP.CrouchModifier		= 0.7 -- Applies if player is crouching.
SWEP.IronSightModifier 	= 0.7 -- Applies if player is in iron sight mode.
SWEP.RunModifier 		= 1.4 -- Applies if player is moving.
SWEP.JumpModifier 		= 1.6 -- Applies if player is in the air (jumping)

-- Note: the jumping and crouching modifiers cannot be applied simultaneously

--------------------
-- Fire Modes --
--------------------
-- You can choose from a list of firemodes, or add your own! \0/
SWEP.AvailableFireModes		= {"Auto","Semi","Grenade"} -- What firemodes shall we use?
-- "Auto", "Burst", "Semi", and "Grenade" are firemodes that are available by default.
SWEP.FireModeIndicators		= {"A","1","G"} -- Set these in the same order as used in SWEP.AvailableFireModes, these will be used in the small indicator screen.
SWEP.IndicatorNames			= {"F2000","F2000","GL1"} -- The names to be used in the indicator screen, keep this short and in the same order as above!!
SWEP.IndicatorSymbols		= {"ppppp","p","t"} -- The symbols to be used in the indicator screen, keep this in the same order as above!!
-- You can use symbols from the hl2 font, where, for example, "p" is a pistol bullet, "r" is a rifle round  (does not scale very well when small, not recommended), "t" is an smg grenade shell and "s" is a shotgun slug.

-- RPM is the rounds per minute the gun can fire for each mode (if applicable)
SWEP.AutoRPM				= 850
SWEP.SemiRPM				= 850
SWEP.DrawFireModes			= true -- Set to true to allow drawing of a visual indicator for the current firemode.

-- Additional parameters for the "Grenade" firemode
SWEP.GrenadeDamage			= 100
SWEP.GrenadeVelocity		= 76 -- in meters per second
SWEP.GrenadeRPM				= 50
