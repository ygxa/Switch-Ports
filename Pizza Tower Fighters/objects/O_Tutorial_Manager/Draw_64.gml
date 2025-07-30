if (!instance_exists(O_Text))
{
    draw_sprite(s_paper, 0, 750, 130);
    
    switch (phase)
    {
        case 1:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 82, "Jump!");
            draw_sprite(spr_checkmark, targetB, 760, 92);
            draw_text(670, 102, "Walk around.");
            draw_sprite(spr_checkmark, targetA, 820, 112);
            break;
        
        case 2:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 102, "Run for 3 Seconds!");
            draw_sprite(spr_checkmark, targetA, 800, 112);
            break;
        
        case 3:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 102, "Crouch for 5 Seconds.");
            draw_sprite(spr_checkmark, targetA, 820, 112);
            break;
        
        case 4:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 82, "Do a Side Tilt.");
            draw_sprite(spr_checkmark, targetB, 840, 92);
            draw_text(670, 102, "Do an Up Tilt.");
            draw_sprite(spr_checkmark, targetA, 840, 112);
            draw_text(670, 122, "Do a Down Tilt.");
            draw_sprite(spr_checkmark, targetC, 840, 132);
            break;
        
        case 5:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 82, "Do a Side Aerial.");
            draw_sprite(spr_checkmark, targetB, 850, 92);
            draw_text(670, 102, "Do an Up Aerial.");
            draw_sprite(spr_checkmark, targetA, 850, 112);
            draw_text(670, 122, "Do a Down Aerial.");
            draw_sprite(spr_checkmark, targetC, 850, 132);
            break;
        
        case 6:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 82, "Do a dash attack!");
            draw_sprite(spr_checkmark, targetA, 850, 92);
            break;
        
        case 7:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(670, 82, "Do a Side Special.");
            draw_sprite(spr_checkmark, targetB, 800, 92);
            draw_text(670, 102, "Do an Up Special.");
            draw_sprite(spr_checkmark, targetA, 800, 112);
            draw_text(670, 122, "Do a Down Special.");
            draw_sprite(spr_checkmark, targetC, 810, 132);
            break;
        
        case 8:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(640, 82, "Get a combo of 5 \nagainst the slime!");
            draw_sprite(spr_checkmark, targetA, 780, 92);
            break;
        
        case 9:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(640, 82, "Hurt the slime's feelings\nwith a well done taunt.");
            draw_sprite(spr_checkmark, targetA, 850, 92);
            break;
        
        case 10:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(630, 82, "Parry the slime's attack!");
            draw_sprite(spr_checkmark, targetA, 780, 92);
            break;
        
        case 11:
            DrawSetText(0, F_Combo, 50, 50);
            draw_text(630, 82, "Perform a Super move.");
            draw_sprite(spr_checkmark, targetA, 780, 92);
            break;
    }
}
