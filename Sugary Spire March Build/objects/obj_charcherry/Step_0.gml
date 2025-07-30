/*switch state
{
	/*
    case baddiestate.idle:
    scr_enemy_charcherry()
        break
    case baddiestate.turn:
     scr_enemy_charcherry()
        break
    case baddiestate.walk:
     scr_enemy_charcherry()
        break
    case baddiestate.land:
       scr_enemy_cherrywait()
        break
    case baddiestate.hit:
       scr_enemy_charcherry()
        break
    case baddiestate.stun:
        scr_enemy_charcherry()
        break
    case baddiestate.Throw:
        scr_enemy_throw()
        break
    case baddiestate.grabbed:
        scr_enemy_cherrywait()
        break
	case baddiestate.cherrywait:
        scr_enemy_cherrywait()
		break;
	case baddiestate.cherryactive:
        scr_enemy_charcherry()
        break;
}*/
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed);
if sprite_index != spr_charcherry_wait && global.panic = 0
	sprite_index = spr_charcherry_wait;
if state != baddiestate.cherrywait && state != baddiestate.frozen && state != baddiestate.cherryactive {
	state = baddiestate.cherrywait;
}