content = -4
image_speed = 0.35
depth = -1
helptimer = 60
helpSpr = new subSprite(spr_confecticage_help, 0, 0.35, true)
helpSound = fmod_createEventInstance("event:/SFX/general/toppinhelp")
fmod_event_set3DPosition(helpSound, (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2))
fmod_studio_event_instance_start(helpSound)
