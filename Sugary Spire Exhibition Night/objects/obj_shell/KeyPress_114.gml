if (global.DebugMode == DebugType.None)
    exit;

if (obj_parent_player.state != PlayerState.noclip)
    obj_parent_player.state = PlayerState.noclip;
else
    obj_parent_player.state = PlayerState.normal;