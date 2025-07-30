// 1) When fully opaque, check the player and startgate together
if fadealpha > 1 {
    // only now look at the player’s coords
    if instance_exists(obj_player) {
        with (obj_player) {
            // if the player is not overlapping the gate, we can fade out + change room
            if !place_meeting(x, y, obj_startgate) {
                other.fadein = 1;

                // room change
                var tgt = targetRoom;
                if room_exists(tgt) {
                    room_goto(tgt);
                } else {
                    room_goto(rm_missing);
                }
            }
        }
    }
}

// 2) Animate the fade alpha
if fadein == 0 {
    fadealpha += 0.1;
} else {
    fadealpha -= 0.1;
}

// 3) Tell the player when fade‑out has begun, so it can run its door animations
if instance_exists(obj_player) {
    with (obj_player) {
        if other.fadein == 1 {
            // stepping out of a door or startgate
            if (state == states.door || state == states.victory)
            && (place_meeting(x, y, par_door) || place_meeting(x, y, obj_startgate)) {
                state       = states.comingoutdoor;
                image_index = 0;
            }
            // if carrying pizza, switch to crouch‑jump
            if state == states.door
            && (sprite_index == spr_player_downpizzabox
                || sprite_index == spr_player_uppizzabox) {
                state = states.crouchjump;
            }
        }
    }
}

// 4) When fully transparent again, destroy the fader
if fadein == 1 && fadealpha < 0 {
    instance_destroy();
}

// 5) While fading in, once we hit full opacity, kill every title‑card
if fadein == 0 && fadealpha > 1 {
    with (obj_titlecard) {
        instance_destroy();
    }
}
