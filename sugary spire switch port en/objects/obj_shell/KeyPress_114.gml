if (global.DebugMode == DebugType.None)
    return;

if (obj_parent_player.state != PlayerState.noclip)
    obj_parent_player.state = PlayerState.noclip;
else
    obj_parent_player.state = PlayerState.normal;