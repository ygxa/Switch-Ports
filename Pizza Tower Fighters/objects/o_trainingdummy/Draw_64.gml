draw_set_halign(fa_center);
draw_set_valign(fa_middle);
DrawSetText(16777215, F_Combo, 50, 50);

if (global.GUIon == true)
{
    draw_text(healthbar_x, healthbar_y, "LAST DAMAGE DEALT:");
    draw_text(healthbar_x + 220, healthbar_y, damagedealtshow);
    draw_text(healthbar_x, healthbar_y + 20, "TOTAL DAMAGE DEALT:");
    draw_text(healthbar_x + 220, healthbar_y + 20, damagedealttotalshow);
    draw_text(healthbar_x, healthbar_y - 20, "COMBO:");
    draw_text_transformed(healthbar_x + 90 + irandom_range(-comboshake, comboshake), (healthbar_y - 20) + irandom_range(-comboshake, comboshake), combo_show, 1 + (combo_show * 0.5), 1 + (combo_show * 0.5), 0);
}
