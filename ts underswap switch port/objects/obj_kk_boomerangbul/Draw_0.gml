var _y = y;

if (state == 0)
    y += (sin(obj_koffink_monster.siner) * 4);

draw_self();
y = _y;

if (!special && state == 0 && timer > 30)
    draw_battle_warner(obj_battlemanager.boxX1, obj_battlemanager.boxY1 + 20, obj_battlemanager.boxX2, obj_battlemanager.boxY1 + 40, timer, true, wantSound);
