accel = 0
canleave = 0

image_speed = 0;
if obj_player.character == "P"
sprite_index = spr_player_rankwait;
else
sprite_index = spr_pizzano_rankwait;
alarm[0] = 125;
depth = -6;
totalalpha = 0
event = 0
	if global.challengemode = 1 && global.highestcombo >= 20 {
	scr_sound(sound_toppingot);
	global.challengemode = 0
	}
	
	if global.challengemode = 1 && global.highestcombo < 20 {
	scr_sound(sound_parry);
	global.challengemode = 0
	}
	if global.challengemode = 2 && global.playminutes >= 2 {
	scr_sound(sound_toppingot);
	global.challengemode = 0
	}
	
	if global.challengemode = 2 && global.playminutes < 2 {
	scr_sound(sound_parry);
	global.challengemode = 0
	}
//Confecti Sprites and stuff
mallowspr = spr_confecti1rank
chocospr = spr_confecti2rank
crackspr = spr_confecti3rank
wormspr = spr_confecti4rank
candyspr = spr_confecti5rank
//Confecti drawer
drawmallow = false
drawchoco = false
drawcrack = false
drawworm = false
drawcandy = false
//confecti image index wow this thing has a lot of variables
mallowdex = 0
chocodex = 0
crackdex = 0
wormdex = 0
candydex = 0
//confecti shake
shake1 = false;
shake2 = false;
shake3 = false;
shake4 = false;
shake5 = false;
//confecti shake
scale1 = 0
scale2 = 0
scale3 = 0
scale4 = 0
scale5 = 0
//secret indexes
card1 = 0
card2 = 0
card3 = 0
//secret event
sevent = 0
//card shake
cshake1 = false
cshake2 = false
cshake3 = false
//card sprite
card1spr = spr_rankcard
card2spr = spr_rankcard
card3spr = spr_rankcard
//card index
carddex1 = 0
carddex2 = 0
carddex3 = 0
//cake sprite index
cakedex = 0
//points
countpoint = 0
//pointshake
pshake = false
//pointspeed
pspeed = 0
counting = false
//rank scale
rscale = 1 //0 replaced by stamp
//stamp animation
stampani = 0
stampdex = 0
//rank image index
rankdex = 0
//player image index
playerdex = 0
//hat message
hatdex = 0
hatunlock = false
hatappear = false
hatdisappear = true
hatmsg = "balls"
hatmsgx = 500
hatmsgy = 600
//Sound effects
stampsnd = 0
//init collect
inicollect = global.collect / 30
//Change Colors only when needed
collected = "0";
colors[0] = choose(0,1,2,3,4,5,6)
colors[1] = choose(0,1,2,3,4,5,6)
colors[2] = choose(0,1,2,3,4,5,6)
colors[3] = choose(0,1,2,3,4,5,6)
colors[4] = choose(0,1,2,3,4,5,6)
colors[5] = choose(0,1,2,3,4,5,6)
colors[6] = choose(0,1,2,3,4,5,6)
colors[7] = choose(0,1,2,3,4,5,6)
colors[8] = choose(0,1,2,3,4,5,6)
colors[9] = choose(0,1,2,3,4,5,6)
//cool bg thing
bgx = 0
bgy = 0
bgspr = bg_rank
bgdex = 0
paltime = 0
rankpal = spr_rankpal
//Janitor Icoms
janspr = spr_rankrudejanitor
janscale = 0
jandraw = 0
//X and Y
clipy = 809
