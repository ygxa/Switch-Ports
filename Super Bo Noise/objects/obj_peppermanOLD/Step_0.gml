targetplayer = global.coop ? instance_nearest(x, y, obj_player1) : obj_player1;

if (obj_bosscontroller.state == 146)
    exit;

if (hp <= 0 && state != 147 && state != 164)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

switch (phase)
{
    case 1:
    case 2:
        normal_func = boss_pepperman_normal;
        break;
    
    case 3:
    case 4:
    case 5:
    case 6:
        normal_func = boss_pepperman_phase3normal;
        break;
}

switch (state)
{
    case 147:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case 2:
        grav = 0.5;
        normal_func();
        break;
    
    case 94:
        grav = 0.5;
        boss_pepperman_jump();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case 110:
        grav = 0.5;
        boss_pepperman_freefall();
        break;
    
    case 113:
        grav = 0.5;
        boss_pepperman_freefallland();
        break;
    
    case 124:
        grav = 0.5;
        boss_pepperman_freefallprep();
        break;
    
    case 155:
        grav = 0.5;
        boss_pepperman_shoulderbash();
        break;
    
    case 159:
        grav = 0.5;
        boss_pepperman_supershoulderbash();
        break;
    
    case 160:
        grav = 0.5;
        boss_pepperman_superattackstart();
        break;
    
    case 161:
        grav = 0.5;
        boss_pepperman_superattackcharge();
        break;
    
    case 78:
        grav = 0.5;
        boss_pepperman_superslam();
        break;
    
    case 164:
        grav = 0.5;
        boss_pepperman_fistmatch();
        break;
    
    case 165:
        grav = 0.5;
        boss_pepperman_fistmatchend();
        break;
    
    case 85:
        grav = 0.5;
        boss_pepperman_shoulder();
        break;
    
    case 163:
        grav = 0.5;
        boss_pepperman_shoulderturn();
        break;
    
    case 136:
        grav = 0.5;
        state_boss_walk(boss_pepperman_decide_attack);
        invincible = 1;
        inv_timer = 2;
        break;
    
    case 130:
        grav = 0.5;
        boss_pepperman_charge();
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
        stunned = targetstunned;
        break;
    
    case 140:
        grav = 0.5;
        state_boss_stun();
        break;
}

xscale = image_xscale;
colliding = !(state == 78 || state == 164 || state == 160 || state == 161);
attacking = state == 155 || state == 110 || state == 124 || state == 159 || state == 85 || state == 78 || state == 164 || state == 160 || state == 161 || state == 136;
