event_inherited();
dogState = obj_greaterdog_monster.vasleep ? 0 : 1;
asleep = dogState == 0;
spittingFactsTimer = 0;
factCount = 0;
zTimer = 0;
image_speed = 0.05;
image_xscale = 2;
image_yscale = 2;
xstart = x;
shake = 2;
heartX = obj_battleheart.x;
heartY = obj_battleheart.y;

if (dogState == 1)
{
    spittingFactsTimer = 30;
    sprite_index = spr_dogwell_awake;
}
