visible = !instance_exists(obj_keyconfig);

if levelselect == 1 {
    if !instance_exists(obj_keyconfig) {
        if (keyboard_check_pressed(global.input_check.down) || gamepad_button_check_pressed(0, global.ctrl_button.down)) && b < 5 {
            b += 1;
        }
    }
    if (keyboard_check_pressed(global.input_check.up) || gamepad_button_check_pressed(0, global.ctrl_button.up)) && b > 0 {
        b -= 1;
    }
    if !instance_exists(obj_fadeout) {
        if keyboard_check_pressed(global.input_check.jump) || gamepad_button_check_pressed(0, global.ctrl_button.jump) {
            with instance_create(x, y, obj_fadeout) {
                if other.b == 0 {
                    obj_player1.targetRoom = desert_1;
                    obj_player1.player_x = 208;
                    obj_player1.player_y = 434;
                    obj_player1.character = "P";
                }
                if other.b == 1 {
                    obj_player1.targetRoom = floor2_room0;
                    obj_player1.player_x = 208;
                    obj_player1.player_y = 434;
                    obj_player1.character = "P";
                }
                if other.b == 2 {
                    obj_player1.targetRoom = floor3_room0;
                    obj_player1.player_x = 976;
                    obj_player1.player_y = 434;
                    obj_player1.character = "P";
                }
                if other.b == 3 {
                    obj_player1.targetRoom = floor4_room0;
                    obj_player1.player_x = 304;
                    obj_player1.player_y = 402;
                    obj_player1.character = "P";
                }
                if other.b == 4 {
                    obj_player1.targetRoom = floor5_room1;
                    obj_player1.player_x = 244;
                    obj_player1.player_y = 187;
                    obj_player1.character = "P";
                }
                if other.b == 5 {
                    obj_player1.targetRoom = golf_room1;
                    obj_player1.player_x = 176;
                    obj_player1.player_y = 402;
                    obj_player1.character = "P";
                }
            }
        }
        if keyboard_check_pressed(global.input_check.slap) || gamepad_button_check_pressed(0, global.ctrl_button.slap) {
            with instance_create(x, y, obj_fadeout) {
                if other.b == 0 {
                    obj_player1.player_x = 250;
                    obj_player1.player_y = 250;
                    obj_player1.character = "P";
                }
                if other.b == 1 {
                    obj_player1.targetRoom = floor2_roomtreasure;
                    obj_player1.player_x = 250;
                    obj_player1.player_y = 250;
                    obj_player1.character = "P";
                }
            }
        }
    }
}
else if levelselect == 0 {
    if !instance_exists(obj_keyconfig) {
        if (keyboard_check(global.input_check.up) || gamepad_button_check(0, global.ctrl_button.up)) && optionselect == 1 {
            optionselect = 0;
        }
        else if (keyboard_check(global.input_check.down) || gamepad_button_check(0, global.ctrl_button.down)) && optionselect == 0 {
            optionselect = 1;
        }
    }
    if optionselect == 0 {
        obj_cursor.y = y - 24;
    }
    else {
        obj_cursor.y = y + 18;
    }
    if optionselect == 0 && (keyboard_check_pressed(global.input_check.jump) || gamepad_button_check_pressed(0, global.ctrl_button.jump)) && !instance_exists(obj_keyconfig) {
        levelselect = 1;
        sprite_index = spr_null;
    }
    if optionselect == 1 && !instance_exists(obj_keyconfig) {
        if keyboard_check_pressed(global.input_check_pressed.jump) {
            instance_create(x, y, obj_keyconfig);
        }
        else if gamepad_button_check_pressed(0, global.ctrl_button.jump) {
        }
    }
}
