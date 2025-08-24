randomize();
var choice = irandom_range(1, 10000);
my_id = choice;
hallwayxscale = 0
hallwayyscale = 0
scr_collision_init()
movespeed = 3
image_speed = 0.15;
character = 0
facing = 2
sliding = 0
function scr_changecharacter(){
	if character = 3{
		character = 0
	}
	if character = 0{
		spr_up = spr_krisup
		spr_down = spr_krisdown
		spr_left = spr_krisleft
		spr_right = spr_krisright
	}
	if character = 1{
		spr_up = spr_krislightup
		spr_down = spr_krislightdown
		spr_left = spr_krislightleft
		spr_right = spr_krislightright
	}
	if character = 2{
		spr_up = spr_ralseiup
		spr_down = spr_ralseidown
		spr_left = spr_ralseileft
		spr_right = spr_ralseiright
	}

}
scr_changecharacter()