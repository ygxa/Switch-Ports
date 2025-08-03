image_speed = 0;
blocker = instance_create_xy(bbox_left, bbox_top, obj_solid);

with (blocker)
{
    image_xscale = (other.bbox_right - other.bbox_left) / 20;
    image_yscale = (other.bbox_bottom - other.bbox_top) / 20;
}

openBlocker1 = -4;
openBlocker2 = -4;
openBlocker3 = -4;
openBlocker4 = -4;
backDoor = instance_create_xy(x, y, obj_staticsprite_instant);

with (backDoor)
{
    sprite_index = other.sprite_index;
    image_index = 2;
    image_speed = 0;
    layer = layer_get_id("MainLayer5");
    visible = false;
}

toggleBlocker = function()
{
    if (!open)
    {
        blocker = instance_create_xy(bbox_left, bbox_top, obj_solid);
        
        with (blocker)
        {
            image_xscale = (other.bbox_right - other.bbox_left) / 20;
            image_yscale = (other.bbox_bottom - other.bbox_top) / 20;
        }
        
        with (openBlocker1)
            instance_destroy();
        
        with (openBlocker2)
            instance_destroy();
        
        with (openBlocker3)
            instance_destroy();
        
        with (openBlocker4)
            instance_destroy();
        
        openBlocker1 = -4;
        openBlocker2 = -4;
        openBlocker3 = -4;
        openBlocker4 = -4;
        
        with (backDoor)
            visible = false;
    }
    else
    {
        with (blocker)
            instance_destroy();
        
        blocker = -4;
        openBlocker1 = instance_create_xy(287, 186, obj_solid, 
        {
            image_xscale: 4,
            image_yscale: 0.2
        });
        openBlocker2 = instance_create_xy(285, 140, obj_solid, 
        {
            image_xscale: 4,
            image_yscale: 0.2
        });
        openBlocker3 = instance_create_xy(300, 122, obj_solid, 
        {
            image_xscale: 4,
            image_yscale: 1
        });
        openBlocker4 = instance_create_xy(300, 190, obj_solid, 
        {
            image_xscale: 4,
            image_yscale: 1
        });
        
        with (backDoor)
            visible = true;
    }
};

actor_shake_init(false);

failToOpen = function()
{
    doShake(3);
    sfx_play(snd_bang);
};

open = false;
