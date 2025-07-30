function player_doise_side_special()
{
    if (hsp != 0)
    {
        facing = sign(hsp);
        direction = facing;
    }
    
    vsp += grv;
    player_col();
    
    if (sprite_index != s_doise_sidespecial)
    {
        noisebomb = 60;
        hitdone = false;
        image_speed = 1;
        hsp = 7 * facing;
        sprite_index = s_doise_sidespecial;
        image_index = 0;
        audio_play_sound(su_pep_shoulder, 50, false);
        ds_list_clear(HitByAttack);
    }
    
    mask_index = s_doise_sidespecial_col;
    var VarHitByAttackNow = ds_list_create();
    noisebomb--;
    var Hits;
    
    if (object_index == o_player_doise)
    {
        Hits = instance_place_list(x, y, O_Player_2, VarHitByAttackNow, false);
    }
    else
    {
        Hits = instance_place_list(x, y, O_Player_1, VarHitByAttackNow, false);
        
        if (global.P2Cpu == true)
        {
            if (global.CPULVL == 5)
            {
                var _checkforparry = irandom_range(1, 2);
                
                if (_checkforparry == 1 && instance_exists(par_projectile))
                {
                    if (point_distance(x, y, par_projectile.x, par_projectile.y) < 64)
                    {
                        state = (12 << 0);
                        mask_index = s_test_idl;
                        accel_final = hsp * facing;
                        last_h = 1 * facing;
                    }
                }
            }
        }
    }
    
    if (Hits > 0)
    {
        for (var i = 0; i < Hits; i++)
        {
            var HitID = ds_list_find_value(VarHitByAttackNow, i);
            
            if (ds_list_find_index(HitByAttack, HitID) == -1)
            {
                ds_list_add(HitByAttack, HitID);
                
                with (HitID)
                    player_hurt(20, 11, -other.facing, 6);
                
                hitdone = true;
            }
        }
    }
    
    ds_list_destroy(VarHitByAttackNow);
    mask_index = s_noise_idle;
    
    if (noisebomb < 1 || place_meeting(x + hsp, y, ObjWall) || key_Q)
    {
        blastdamaged = 0;
        instance_create_layer(x, y, layer, o_player_doise_explosion);
        state = (0 << 0);
        hsp = -5 * facing;
    }
    
    if (hitdone)
    {
        instance_create_layer(x, y, layer, o_player_doise_explosion);
        mask_index = s_noise_idle;
        state = (24 << 0);
        hsp = -5 * facing;
        vsp = -9;
        hitstun = 30;
        noisebomb = 0;
    }
}
