event_perform_object(obj_parent_enemy, ev_create, 0)
depth = 0
isFlyingEnemy = false
canSpawnStunBird = true
canTurnSelf = false
canGetScared = true
canBeStomped = true
canBeKilled = true
canBeGrabbed = true
canBreakBlocks = false
state = EnemyStates.idle
scr_collision_init()
grav = 0.5
hitHsp = 0
hitVsp = 0
movespeed = 0
doCollision = true
forceMach2Hit = false
paletteSprite = spr_null
paletteSelect = 0
baddieInvincibilityBuffer = 0
baddieScareBuffer = 0
tauntBuffer = false
flash = false
alarm[1] = 3
tauntBufferEffect = -4
escapePortalEffect = -4
doRedAfterImage = false
redAfterImagebuffer = 0
redAfterImagebufferMax = 10

enemyDeath_SpawnBody = function()
{
	with (instance_create(x, y, obj_baddieDead))
	{
		canrotate = true
		image_xscale = other.image_xscale
		image_blend = other.image_blend
		sprite_index = other.baddieSpriteDead
		paletteSprite = other.paletteSprite
		paletteSelect = other.paletteSelect
	}
}

giveScore = true
baddieSpriteIdle = spr_gumslime_walk
baddieSpriteStun = spr_gumslime_stun
baddieSpriteWalk = spr_gumslime_walk
baddieSpriteTurn = spr_gumslime_walk
baddieSpriteGrabbed = spr_gumslime_stun
baddieSpriteScared = spr_gumslime_scared
baddieSpriteDead = spr_gumslime_dead
baddieSpriteRage = spr_gumslime_rage
birdEffect = new subSprite(spr_enemyBirdEffect)
angerEffect = new subSprite(spr_angryCloud)
throwAntiGrav = false
weakThrowHit = false
baddieCollisionBoxEnabled = true
canBeStomped = true
canBeGrabbed = true
mach2Bumpable = true
hasSquashedX = false
squashValueX = 0
hasSquashedY = false
squashValueY = 0
baddieStunTimer = 0
jumpedFromBlock = false
invincibleBaddie = false
markedForDeath = false
wetTimer = 0
wetTimerEffect = 3
wetTimerMax = 150
draw_xscale = 0
draw_yscale = 0
draw_x = 0
draw_y = 0
dark_alpha = 1
eliteHP = 1
eliteHPMax = 0
scare_jump = false
scare_jump_buffer = 0
ragereset = 0
painter = false
flickertime = 0
canBeKilled = true
touchedground = 0
frozenState = 0
frozenSpriteIndex = spr_player_PZ_idle
frozenImageIndex = 0
frozenImageSpeed = 0.35
frozenMoveSpeed = 0
frozenGrav = 0.35
frozenHsp = 0
frozenVsp = 0
scr_enemySounds_init()
