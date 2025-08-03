if (global.control_menu && (global.credits_from_menu || ds_map_find_value(global.pflags_global, "skip_credits") == 2))
    creditsY -= (moveSpeed * 6);
else
    creditsY -= moveSpeed;

alarm[1] = 1;
