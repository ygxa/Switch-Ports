if (parryable && other.state == 86 && other.parry_inst != -4)
    exit;

player_hurt(dmg, other.id);
