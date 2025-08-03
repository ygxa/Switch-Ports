if (bridgeX <= 320)
{
    if (beganBridgeMove && targetX == -1)
        hspeed = 4;
    
    var inst = instance_create_xy(bridgeX, 130, obj_md_sewer_bullet);
    inst.hspeed = 3;
    inst.vspeed = 7;
    sfx_play(snd_throw);
    bridgeX += 15;
    alarm[2] = 8;
}
else
{
    bridgeX = -1;
    hspeed = 0;
}
