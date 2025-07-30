if (sprite_index == spr_weirdfish_throw)
    exit;

with (other)
{
    if (state != 210 && !(state == 271 || state == 270 || state == 273 || state == 272))
    {
        other.playerID = id;
        other.sprite_index = spr_weirdfish_throw;
        other.image_index = 0;
        x = other.x;
        y = other.y;
        fishthrown = true;
        event_play_oneshot("event:/SFX/misc/transfo", x, y);
        fmod_event_play(voice_hurt);
        xscale = -other.image_xscale;
        hsp = 0;
        vsp = 0;
        movespeed = 0;
        state = 273;
    }
}
