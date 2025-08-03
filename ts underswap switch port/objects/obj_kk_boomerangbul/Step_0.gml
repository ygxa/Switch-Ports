if (special && state != 3)
{
    if (image_speed > 0)
    {
        if ((timer % 2) == 0)
        {
            with (instance_create_xy(x + 46, y + 22, obj_afterimage_fader))
            {
                sprite_index = spr_kk_face_boomerang_centered;
                image_index = 0;
                image_speed = 0;
                image_xscale = other.image_xscale;
                image_yscale = other.image_yscale;
                image_blend = other.image_blend;
                scaleSpeed = 0.025;
                fadeSpeed = 0.05;
                depth = other.depth + 1;
            }
        }
    }
    else if ((timer % 6) == 0)
    {
        with (instance_create_xy(x + 46 + (sin(obj_koffink_monster.siner) * 4), y + 22, obj_afterimage_fader))
        {
            sprite_index = spr_kk_face_boomerang_centered;
            image_index = 0;
            image_speed = 0;
            image_xscale = other.image_xscale;
            image_yscale = other.image_yscale;
            image_blend = other.image_blend;
            scaleSpeed = 0.05;
            fadeSpeed = 0.05;
            depth = other.depth + 1;
        }
    }
}

switch (state)
{
    case 0:
        blender = number_approach_linear(blender, 1, 0.15);
        image_blend = merge_color(obj_koffink_monster.image_blend, c_white, blender);
        
        if (timer == 66)
        {
            state = 1;
            timer = 0;
        }
        
        break;
    
    case 1:
        if (timer == 1)
        {
            x = 650;
            y = special ? 180 : 234;
            hspeed = special ? -42 : -35;
        }
        
        hspeed += 1;
        y += 1.5;
        
        if (special && x < -94)
        {
            state = 3;
            timer = 0;
            hspeed = 0;
            x = -200;
            var row1 = obj_battleheart_purple.getRowY(0);
            var row2 = obj_battleheart_purple.getRowY(1);
            var row3 = obj_battleheart_purple.getRowY(2);
            
            if (irandom(1) == 0)
            {
                var temp = row1;
                row1 = row3;
                row3 = temp;
            }
            
            var start = -180;
            var width = 75;
            bt_bullet(obj_kk_boomerangbul_mini, start, row1, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - width, row2, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 2), row2, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 3), row1, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 4), row3, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 5), row2, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 6), row2, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 7), row3, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 8), row1, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 9), row2, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 10), row2, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 11), row1, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 12), row3, obj_koffink_monster);
            bt_bullet(obj_kk_boomerangbul_mini, start - (width * 13), row2, obj_koffink_monster);
            break;
        }
        
        if (hspeed > 10)
        {
            blender = number_approach_linear(blender, 0, 0.15);
            image_blend = merge_color(obj_koffink_monster.image_blend, c_white, blender);
        }
        
        if (x > 650)
        {
            state = 2;
            timer = 0;
        }
        
        break;
    
    case 2:
        if (timer == 1)
        {
            x = 650;
            y = 42;
            hspeed = -30;
        }
        else if (timer == 10)
        {
            with (obj_koffink_monster)
            {
                sprite_index = spr_kk_body_tip;
                sfx_play(snd_grab, 80, false);
                view_shake(2, 2);
            }
            
            instance_destroy();
            break;
        }
        
        break;
    
    case 3:
        if (timer == 136)
        {
            state = 2;
            timer = 0;
        }
        
        break;
}

timer++;
