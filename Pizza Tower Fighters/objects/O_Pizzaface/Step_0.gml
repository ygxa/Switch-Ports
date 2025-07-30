event_inherited();

if (instance_exists(o_youwon))
    state = (18 << 0);

if (damagemeter > 0)
    damagemeter = 0;

if (room == R_Top)
{
    if (hp < (hpmax / 2) && layer_get_visible(phase1tile) == true)
    {
        if (!instance_exists(fadeid))
            fadeid = instance_create_depth(0, 0, -1000000, o_secret_top);
        
        if (!instance_exists(fadeid))
            exit;
        
        layer_set_visible(phase1tile, false);
        layer_set_visible(phase1tile2, false);
        layer_set_visible(phase1tile3, false);
        layer_set_visible(phase3tile, true);
        layer_set_visible(phase3tile2, true);
        layer_set_visible(phase3tile3, true);
        layer_set_visible(phase3tile4, true);
        layer_set_visible(phase3tile5, true);
    }
}

if (blastdamaged != 0)
{
    bdamaged_timr--;
    
    if (bdamaged_timr < 0)
    {
        bdamaged_timr = 30;
        blastdamaged = 0;
    }
}

switch (state)
{
    case (0 << 0):
        pizzaface_intro();
        break;
    
    case (1 << 0):
        pizzaface_intro2();
        break;
    
    case (2 << 0):
        pizzaface_idle();
        break;
    
    case (3 << 0):
        pizzaface_lunge_start();
        break;
    
    case (4 << 0):
        pizzaface_lunge();
        break;
    
    case (5 << 0):
        pizzaface_lunge_land();
        break;
    
    case (6 << 0):
        pizzaface_lunge_recover();
        break;
    
    case (7 << 0):
        pizzaface_lunge_end();
        break;
    
    case (8 << 0):
        pizzaface_eyeball_attack();
        break;
    
    case (9 << 0):
        pizzaface_mustache_start();
        break;
    
    case (10 << 0):
        pizzaface_mustache();
        break;
    
    case (11 << 0):
        pizzaface_mouth_attack();
        break;
    
    case (12 << 0):
        pizzaface_bg_lunge_start();
        break;
    
    case (13 << 0):
        pizzaface_bg_lunge_land();
        break;
    
    case (14 << 0):
        pizzaface_death();
        break;
    
    case (15 << 0):
        pizzaface_mustache_prepare();
        break;
    
    case (16 << 0):
        pizzaface_bg_lunge();
        break;
    
    case (18 << 0):
        pizzaface_win();
        break;
    
    case (19 << 0):
        pizzaface_recovering();
        break;
}
