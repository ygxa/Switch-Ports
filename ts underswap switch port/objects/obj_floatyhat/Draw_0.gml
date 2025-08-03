var px = x;
var py = y;

if (room == rm_ruins1)
{
    siner += 0.1;
    
    if (siner >= (2 * pi))
        siner -= (2 * pi);
    
    var s = sin(siner) * 20;
    
    if (y > 120)
    {
        approach = number_approach_smooth(approach, 0, 0.15, 0.005);
        x += (s * approach);
        y -= (abs(s) * 0.4 * approach);
    }
    else
    {
        x += s;
        y -= (abs(s) * 0.4);
    }
}

draw_self();
x = px;
y = py;
