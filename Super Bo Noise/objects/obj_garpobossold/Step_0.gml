targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (obj_bosscontroller.state == 146)
    exit;

if (hp <= 0 && state != 147 && state != 164)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

image_speed = 0.35;

if (knightbuffer > 0)
    knightbuffer--;

switch (phase)
{
    case 0:
        normal_func = boss_garpo_phase1normal;
        break;
    
    case 1:
        normal_func = boss_pizzahead_phase2normal;
        break;
    
    case 2:
        normal_func = boss_pizzahead_phase3normal;
        break;
}

switch (state)
{
    case 147:
        grav = 0.5;
        break;
    
    case 2:
        grav = 0.5;
        normal_func();
        break;
    
    case 232:
        grav = 0.5;
        boss_garpo_ram();
        break;
    
    case 228:
        grav = 0.5;
        boss_garpo_moustache();
        break;
    
    case 230:
        grav = 0.5;
        boss_garpo_eyes();
        break;
    
    case 229:
        grav = 0.5;
        boss_garpo_mouth();
        break;
    
    case 231:
        grav = 0.5;
        boss_garpo_nose();
        break;
    
    case 233:
        boss_garpo_phase2transition();
        break;
    
    case 234:
        boss_pizzahead_look();
        break;
    
    case 235:
        boss_pizzahead_fishing();
        break;
    
    case 237:
        boss_pizzahead_bombrun();
        break;
    
    case 238:
        boss_pizzahead_npcthrow();
        break;
    
    case 239:
        boss_pizzahead_portraitthrow();
        break;
    
    case 240:
        boss_pizzahead_enguarde();
        break;
    
    case 241:
        boss_pizzahead_sexypicture();
        break;
    
    case 242:
        boss_pizzahead_pullinglevel();
        break;
    
    case 243:
        boss_pizzahead_eat();
        break;
    
    case 244:
        boss_pizzahead_surprisebox();
        break;
    
    case 245:
        boss_pizzahead_spinningrun();
        break;
    
    case 246:
        boss_pizzahead_spinningkick();
        break;
    
    case 247:
        boss_pizzahead_spinningpunch();
        break;
    
    case 248:
        boss_pizzahead_groundpunch();
        break;
    
    case 249:
        boss_pizzahead_bigkick();
        break;
    
    case 250:
        boss_pizzahead_slamhead();
        break;
    
    case 251:
        boss_pizzahead_slamhead2();
        break;
    
    case 136:
        grav = 0.5;
        
        if (grounded)
            state = 2;
        
        invincible = 1;
        inv_timer = 2;
        break;
    
    case 63:
        grav = 0.5;
        state_boss_chainsaw();
        break;
    
    case 86:
        grav = 0.5;
        state_boss_taunt();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case 149:
        grav = 0.5;
        state_boss_parry();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case 139:
        grav = 0.5;
        scr_enemy_hit();
        stunned = 30;
        break;
    
    case 140:
        grav = 0.5;
        state_boss_stun();
        break;
}

if (phase == 0 && state != 232)
    invincible = 1;
else
    invincible = 0;

attacking = state == 232 || state == 231 || state == 246 || state == 247 || state == 248 || state == 250 || state == 251;
colliding = state != 232;

if (phase > 0)
{
    mask_index = spr_pizzahead_giddy;
    stunfallspr = spr_pizzahead_giddy;
    walkspr = spr_pizzahead_giddy;
}
