var player_obj = get_nearestPlayer()
hsp = sign(x - player_obj.x) * random_range(10, 18)

if (player_obj.x != x)
	image_xscale = -sign(x - player_obj.x)

vsp = random_range(-10, -18)
grav = 0.3
alarm[0] = 5
drawx = x
drawy = y
canrotate = false
rotatedirection = choose(-1, 0, 1)
rotatevalue = choose(0, irandom_range(-20, 20))
pal_sprite = -4
paletteSprite = -4
paletteSelect = -4
col = 0
depth = -250
tossCooldown = 10
