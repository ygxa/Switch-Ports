depth = -7
image_speed = 0.35
playerID = -4
bobsin = 0
time = 0
drawnImageIndex = 0
sprite_index = spr_treasure_entryway
var sprite_name = string("spr_treasure_{0}", global.InternalLevelName)
var asset_index = asset_get_index(sprite_name)

if (asset_index != -1)
	sprite_index = asset_index
