event_inherited();
doIDie = false;
depth = obj_asgore_monster.depth - 1;
sides = ds_list_create();
side = -2;
currSide = 0;
timeBetweenActions = 30;
moveSpeed = 0.5;
image_xscale = 2;
image_yscale = 2;
image_angle = 0;
state = 0;
image_alpha = 0;
image_blend = #ED1C24;
yOffset = 0;
yOffsetToApproach = 0;
angleToApproach = image_angle;
specialAttack = false;
specialX = -1;
specialY = -1;
armAlpha = 0;
fadeIn = false;
fadeOut = false;
fadeGray = 0;
sequence = undefined;

setState = function(argument0)
{
    state = argument0;
    
    switch (argument0)
    {
        case 0:
            image_angle = 0;
            yOffset = 0;
            yOffsetToApproach = 0;
            angleToApproach = 0;
            alarm[0] = timeBetweenActions;
            break;
        
        case 1:
            for (var i = 0; i < ds_list_size(sides); i++)
            {
                var flash1 = undefined;
                var flash2 = undefined;
                
                switch (ds_list_find_value(sides, i))
                {
                    case -1:
                        flash1 = instance_create_xy(obj_asgore_monster.x + 134, obj_asgore_monster.y + 66, obj_asgb_eyeflash);
                        
                        with (flash1)
                            pitch = 0.9;
                        
                        flash2 = -4;
                        break;
                    
                    case 0:
                        flash1 = instance_create_xy(obj_asgore_monster.x + 134, obj_asgore_monster.y + 66, obj_asgb_eyeflash);
                        flash2 = instance_create_xy(obj_asgore_monster.x + 154, obj_asgore_monster.y + 66, obj_asgb_eyeflash);
                        
                        with (flash1)
                            sprite_index = spr_asgb_eyeflash_double;
                        
                        with (flash2)
                            sprite_index = spr_asgb_eyeflash_double;
                        
                        break;
                    
                    case 1:
                        flash1 = instance_create_xy(obj_asgore_monster.x + 154, obj_asgore_monster.y + 66, obj_asgb_eyeflash);
                        
                        with (flash1)
                            pitch = 1.1;
                        
                        flash2 = -4;
                        break;
                }
                
                flash1.delay = i * timeBetweenActions;
                
                if (flash2 != -4)
                    flash2.delay = i * timeBetweenActions;
            }
            
            alarm[0] = timeBetweenActions + ((ds_list_size(sides) - 1) * timeBetweenActions);
            break;
        
        case 2:
            fadeIn = true;
            sfx_play(snd_speargrow, 80, false);
            alarm[0] = 20;
            break;
        
        case 3:
            yOffsetToApproach = -100;
            angleToApproach = 180;
            
            if (specialAttack && currSide == (ds_list_size(sides) - 1))
            {
                obj_asgore_monster.visible = false;
                visible = false;
                var tracks = sequence_get(seq_sadgore).tracks;
                var len = array_length(tracks);
                
                for (var i = 0; i < len; i++)
                {
                    if (tracks[i].type == 11)
                        tracks[i] = tracks[i].tracks[0];
                    
                    switch (tracks[i].name)
                    {
                        case "spr_asgb_cloaked":
                        case "spr_asgb_final1":
                        case "spr_asgb_final1c":
                        case "spr_asgb_final3":
                        case "spr_asgb_final3b":
                        case "spr_asgb_final4":
                        case "spr_asgb_final4b":
                        case "spr_asgb_final5":
                        case "spr_asgb_final5b":
                        case "spr_asgb_final6":
                        case "spr_asgb_final7":
                        case "spr_asgb_legs":
                        case "spr_asgb_cape":
                        case "spr_asgb_torso":
                            var subTracks = tracks[i].tracks;
                            var subLen = array_length(subTracks);
                            
                            for (var j = 0; j < subLen; j++)
                            {
                                if (subTracks[j].type == 4)
                                {
                                    var newArr = array_create(1);
                                    newArr[0] = sequence_keyframedata_new(4);
                                    newArr[0].color = [1, color_get_red(obj_asgore_monster.flavorColor) / 255, color_get_green(obj_asgore_monster.flavorColor) / 255, color_get_blue(obj_asgore_monster.flavorColor) / 255];
                                    newArr[0].channel = 0;
                                    var kf = sequence_keyframe_new(4);
                                    kf.channels = newArr;
                                    subTracks[j].keyframes = [kf];
                                }
                            }
                            
                            break;
                    }
                }
                
                sequence = layer_sequence_create(layer_create(obj_asgore_monster.depth + 1), obj_asgore_monster.x, obj_asgore_monster.y, seq_sadgore);
                layer_sequence_xscale(sequence, 2);
                layer_sequence_yscale(sequence, 2);
                layer_sequence_play(sequence);
                exit;
            }
            
            if (specialAttack)
                obj_asgore_monster.sinerIntensity += 0.4;
            
            side = ds_list_find_value(sides, currSide);
            obj_asgore_monster.xOffset = 40 * side;
            
            if (side == -1)
                obj_asgore_monster.xOffset -= 8;
            
            sfx_play(snd_speargrow, 80, false);
            alarm[0] = timeBetweenActions;
            break;
        
        case 4:
            yOffsetToApproach = 140;
            sfx_play(snd_throw, 80, false);
            alarm[1] = round(moveSpeed * 10) - 1;
            alarm[0] = timeBetweenActions;
            break;
        
        case 5:
            yOffsetToApproach = 0;
            angleToApproach = 180;
            obj_asgore_monster.xOffset = 0;
            var totalSides = ds_list_size(sides) - 1;
            
            if (currSide == totalSides)
            {
                if (!specialAttack)
                {
                    fadeOut = true;
                }
                else
                {
                }
            }
            else if (specialAttack && (currSide + 1) == totalSides)
            {
                currSide++;
                specialX = 322;
                specialY = 170;
                alarm[2] = 30;
            }
            else
            {
                currSide++;
                setState(3);
            }
            
            break;
    }
};

setState(state);
