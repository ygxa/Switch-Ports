if (global.bev_subtype == 1)
{
    if (drawOnGround)
    {
        with (obj_battlemanager)
        {
            spareObjOverride = other.id;
            spareEvOverride = 10;
        }
        
        exit;
    }
}
else if (global.bev_subtype == 2)
{
    if (vdonefighting)
    {
        audio_kill_all();
        sfx_play(snd_click);
        obj_battlemanager.mainState = (0 << 0);
        bt_set_boxtype((1 << 0));
        
        with (obj_battleheart)
        {
            x = 312;
            y = 312;
            visible = true;
        }
        
        with (instance_create_xy(319, 118, obj_battledamage))
        {
            isMiss = true;
            depth = -110;
            cosmetic = true;
        }
        
        with (instance_create_xy(0, 0, obj_staticsprite_instant))
        {
            depth = -100;
            sprite_index = spr_black;
            image_xscale = 640;
            image_yscale = 480;
            inst_set_self("black_cover");
        }
        
        with (obj_battletarget)
            doFade = true;
        
        alarm[2] = 75;
        exit;
    }
}

event_inherited();

if (global.bev_subtype == 2)
{
    if (instance_exists(obj_battledamage))
    {
        obj_battledamage.minHpDisplay = 20;
        
        if (obj_battledamage.monsterHpTarget <= 40 && vlowhp == 0)
        {
            vlowhp = 1;
            obj_battledamage.progressBattle = false;
            
            with (obj_battletarget)
                doFade = true;
            
            dx_scene("battles.kk.fall_low_hp");
        }
        else if (!obj_battledamage.isMiss)
        {
            repeat (5)
                instance_create(obj_kk_batbul_damage);
        }
    }
}
