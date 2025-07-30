function scr_scareenemy()
{
    var player = instance_nearest(x, y, obj_player1);
    
    if (state != 6 && state != 140 && state != 139 && state != 268)
    {
        if ((player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ((player.xscale > 0 && x >= player.x) || (player.xscale < 0 && x <= player.x))) && (player.state == 43 || player.state == 123 || player.state == 33 || player.state == 186 || player.state == 22 || player.state == 40 || (player.state == 81 && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
            scaredbuffer = 100;
        
        if (scaredbuffer > 0 && sprite_index != scaredspr && state != 140 && state != 157)
        {
            state = 128;
            sprite_index = scaredspr;
            
            if (x != player.x)
                image_xscale = -sign(x - player.x);
            
            if (irandom(100) <= 5)
                event_play_oneshot("event:/SFX/enemies/enemyrarescream", x, y);
            
            if (grounded)
                vsp = -3;
        }
    }
    
    exit;
}
