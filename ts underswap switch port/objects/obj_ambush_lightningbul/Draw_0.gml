draw_self();

if (gateDestroyer)
{
    dodgeroom_predraw();
    
    with (obj_crys_gate)
        draw_sprite(spr_crys_gate, 4, x, y);
    
    shader_postdraw();
}
