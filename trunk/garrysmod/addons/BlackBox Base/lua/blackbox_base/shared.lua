--BlackBox Weaponry Basescript
--By NinjaTuna
--NOT to be reproduced in any way without naming the original author


if SERVER then
	
	AddCSLuaFile( "shared.lua" )		-- The client needs these files when playing in a server
	AddCSLuaFile( "cl_init.lua" )
	
	SWEP.HoldType			= "ar2"		-- Hold it like a rifle by default
	SWEP.Weight				= 5			-- Default weight is 5 kg, bit high, but we will override it anyways!
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	
end

---------------------------------------
-----------//General Info//------------
---------------------------------------

SWEP.Category			= "BlackBox Weaponry"

SWEP.Author				= "NinjaTuna"
SWEP.Contact			= ""
SWEP.Purpose			= ""
SWEP.Instructions		= ""

SWEP.Spawnable			= false		-- The basescript should not show up in our spawn menu
SWEP.AdminSpawnable		= false

SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= -1
SWEP.Primary.Ammo				= "smg1"

SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= -1
SWEP.Secondary.Ammo				= "none"

-- Some technical data, accuracy, firerate and such
SWEP.Primary.Damage		= 20
SWEP.Primary.Recoil		= 0.2
SWEP.Primary.Cone		= 0.02
SWEP.Primary.NumShots	= 1
SWEP.AutoRPM			= 700 -- The amount of rounds (bullets) the weapon fires per minute


---------------------------------------
---------//Weapon Functions//----------
---------------------------------------

--//Making it deploy
function SWEP:Deploy() return true end

--//Initializing, this function is called only one time
function SWEP:Initialize

	self.Primary.Delay = 1/(SWEP.AutoRPM/60)

end

--//Reloading, this function is called when we press the "reload" key ("R" by default)
function SWEP:Reload()

	self.Weapon:DefaultReload( ACT_VM_RELOAD ) -- Weapon goes into reload and plays the animation and sound specified in the model itself
	
end

function SWEP:PrimaryAttack()

	self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay ) -- We set the delay before firing the next round
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if not self:CanFire(self.Weapon:Clip1()) then return end
	
	self.Weapon:EmitSound( self.Primary.Sound ) -- No shot without sound
	self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone )
	self:TakePrimaryAmmo( 1 ) -- You wanted infinite ammo? Don't think so...
	
	if self.Owner:IsNPC() then return end
	
	self.Owner:ViewPunch( Angle( math.Rand(-0.2,-0.1) * self.Primary.Recoil, math.Rand(-0.1,0.1) *self.Primary.Recoil, 0 ) ) -- Visual recoil or it gets too easy...
	
end

function SWEP:CSShootBullet( dmg, recoil, numbul, cone )

	numbul 	= numbul 	or 1
	cone 	= cone 		or 0.01

	local bullet = {}
	bullet.Num 		= numbul
	bullet.Src 		= self.Owner:GetShootPos()	// Source
	bullet.Dir 		= self.Owner:GetAimVector()	// Dir of bullet
	bullet.Spread 	= Vector( cone, cone, 0 )		// Aim Cone
	bullet.Tracer	= self.TracerFreq
	bullet.TracerName	= self.TracerType
	bullet.Force	= self.Primary.BulletForce		// Amount of force to give to phys objects
	bullet.Damage	= dmg
	
end

function SWEP:SecondaryAttack()

end

function SWEP:CanFire(clip)

	if not self.Weapon or not self.Owner or not (self.OwnerIsNPC or self.Owner:Alive()) then return end
	
	if clip <= 0 or (self.Owner:WaterLevel() >= 3 and not self.FiresUnderwater) then
	
		self.Weapon:EmitSound("Weapon_Pistol.Empty")
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.2)
		return false -- Note that we don't automatically reload.  The player has to do this manually.
		
	end
	
	return true

end

