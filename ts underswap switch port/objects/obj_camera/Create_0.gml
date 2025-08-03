with (obj_camera)
{
    if (id != other.id)
        instance_destroy();
}

obj_gamemanager.customViewMode = true;
targetX = 0;
targetY = 0;
xChange = 0;
yChange = 0;
counter = 0;
time = 60;
resetAtEnd = false;
resumeSceneAtEnd = false;
destroyAtEnd = false;
canAdvance = false;
started = false;
alarm[0] = 1;
