alpha = 0;
fadeDirection = 4;
invincibilityTimer = 0;
shakeValue = 0;
cutscene = false;
ignoreFaders = false;
kill = true;
dingCounter = 0;
allowDingSfx = true;
var outline = layer_get_id("Outline0");

for (var i = 1; outline != -1 && i <= 50; i++)
{
    layer_script_begin(outline, outline_predraw);
    layer_script_end(outline, shader_postdraw);
    
    if (!global.use_shaders)
        layer_set_visible(outline, false);
    
    outline = layer_get_id(_string("Outline{0}", i));
}

if (!everyLayer)
{
    var mainLayer = layer_get_id("MainLayer0");
    
    for (var i = 1; mainLayer != -1 && i <= 50; i++)
    {
        layer_script_begin(mainLayer, dodgeroom_predraw);
        layer_script_end(mainLayer, shader_postdraw);
        mainLayer = layer_get_id(_string("MainLayer{0}", i));
    }
}

layer = layer_create(-9000);

if (room == rm_ruins3)
{
    topLayers[1] = layer_get_id("MainLayer6");
    topLayers[0] = layer_get_id("MainLayer5");
}

hitCycle = 0;

damage = function(argument0, argument1)
{
    if (invincibilityTimer == 0)
    {
        if (argument1 == 1)
        {
            if (global.difficulty <= 0.1)
            {
                if (hitCycle != 0)
                    argument1 = 0;
                
                hitCycle = (hitCycle + 1) % 2;
            }
        }
        
        invincibilityTimer = 30;
        obj_player.dodgingHeartFrame = 1;
        player_health(-argument1);
        
        with (argument0)
            event_user(1);
        
        if (global.playerhp > 0)
            sfx_play(snd_hurt);
        
        shakeValue = 2;
        alarm[0] = 1;
    }
};
