draw_set_halign(fa_center);
draw_set_valign(fa_middle);
DrawSetText(16777215, F_Combo, 50, 50);
draw_text(healthbar_x, healthbar_y - 20, "COMBO:");
draw_text_transformed(healthbar_x + 90 + irandom_range(-comboshake, comboshake), (healthbar_y - 20) + irandom_range(-comboshake, comboshake), combo, 1 + (combo * 0.5), 1 + (combo * 0.5), 0);
