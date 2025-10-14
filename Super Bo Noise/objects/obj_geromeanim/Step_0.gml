var i;

if (floor(image_index) > 13 && instance_exists(obj_geromedoor) && obj_geromedoor.image_index <= 0)
{
    obj_geromedoor.image_index = 1;
    camera_shake(2, 5);
    scr_soundeffect(choose(sfx_breakblock1,sfx_breakblock2));
    i = 0;
    
    repeat (sprite_get_number(spr_geromedoor_debris))
    {
        instance_create(obj_geromedoor.x + 48, obj_geromedoor.y + 55, obj_lock, 
        {
            sprite_index: spr_geromedoor_debris,
            image_index: i
        });
        i++;
    }
}