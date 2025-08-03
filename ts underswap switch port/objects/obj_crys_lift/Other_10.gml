global.canmove = false;

if (ruth_enabled())
    jumpSprite = spr_chara_jump_ruth;
else if (evac_anywhere())
    jumpSprite = spr_chara_jump_evac;
else
    jumpSprite = spr_chara_jump;

with (obj_player)
{
    visible = false;
    lookDirection = 1;
    lookDirectionLag = 1;
    other.jumpStartX = x;
    other.jumpStartY = y;
}

obj_gamemanager.customViewMode = true;

if (!evil)
{
    var cameraTargetX = (x + 20) - 160;
    var cameraTargetY = (y + 5) - 120;
    scene_camera_pan(cameraTargetX, cameraTargetY, 15, true);
}

with (obj_camera)
    resetAtEnd = false;

jumpProgress = 0;
jumpX = jumpStartX;
jumpY = jumpStartY;
state = (1 << 0);
moveSpeed = -1;
creditsTimer = 0;
