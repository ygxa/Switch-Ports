canmove = true
pausedInstances = ds_list_create()
secretIconScale = [2, 2, 2]
secretIconVisible = [0, 0, 0]
i = 0
color = make_color_rgb(121, 103, 151)
selected = 0
image_speed = 0
shroomdone = 0
cheesedone = 0
tomatodone = 0
sausagedone = 0
pineappledone = 0
depth = -98
draw_screen = 0
custompal = 0
pal = 1
bgTileX = 0
bgTileY = 0
pauseBorder = spr_newpause_border
pauseMusic = fmod_createEventInstance("event:/music/pause")
pauseSurface = -1
pausedSprite = undefined
playerPauseSprite = spr_pizzelle_pause
playerPauseIndex = 0
pausecount = -1
pause_map = ds_map_create()
ds_map_set(pause_map, "RESUME", 0)
ds_map_set(pause_map, "OPTIONS", 1)
ds_map_set(pause_map, "RETRY", 2)
ds_map_set(pause_map, "TASKS", 3)
ds_map_set(pause_map, "EXIT", 4)
ds_map_set(pause_map, "MAIN MENU", 4)
inputBufferDown = 0
inputBufferUp = 0
roomMusicPause = false
secretPause = false
escapeMusicPause = false
musicReverb = false
sfxReverb = false
pause_options = []
borderscale = 4
whitealpha = 0
pauseslidein = 500
shake = 0
screensprite = -4
