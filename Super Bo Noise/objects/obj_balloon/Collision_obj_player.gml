if (other.state == 188)
    exit;

create_particle(x, y, 6, 0);
other.vsp = -14;
other.jumpstop = 1;
visible = false;
x = -100;
y = -100;
respawn = 100;

if (other.state == 94)
    other.sprite_index = other.spr_machfreefall;

if (other.state == 39)
{
    other.sprite_index = other.spr_machfreefall;
    other.state = 94;
}
