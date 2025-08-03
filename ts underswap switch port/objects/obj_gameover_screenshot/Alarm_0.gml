instance_create(obj_heart_gameover);

if (!is_undefined(global.gameover_data.snapshotSprite))
{
    if (global.battle_id != 43 || cb_fight_type() != 2)
    {
        sprite_delete(global.gameover_data.snapshotSprite);
        global.gameover_data.snapshotSprite = undefined;
    }
}

instance_destroy();
