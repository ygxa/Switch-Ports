if (drawPost)
{
    if (bt_set_post())
        exit;
}

var preZTest = gpu_get_ztestenable();
var preATest = gpu_get_alphatestenable();
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);
draw_self();

if (state == 7)
{
    var preDepth = gpu_get_depth();
    gpu_set_depth(preDepth + 1);
    draw_set_alpha(fade);
    var beamDir = image_angle - 90;
    var scaleFactor = image_xscale / 2;
    var xx = lengthdir_x(70, beamDir) * scaleFactor;
    var yy = lengthdir_y(70, beamDir) * scaleFactor;
    var randX = random(2) - random(2);
    var randY = random(2) - random(2);
    var xxx = lengthdir_x(1000, beamDir);
    var yyy = lengthdir_y(1000, beamDir);
    draw_set_color(c_white);
    draw_line_width_pix(x + xx + randX, y + yy + randY, x + xxx + randX, y + yyy + randY, blastThicc + bb);
    var xxa = lengthdir_x(50, beamDir) * scaleFactor;
    var yya = lengthdir_y(50, beamDir) * scaleFactor;
    var xxb = lengthdir_x(60, beamDir) * scaleFactor;
    var yyb = lengthdir_y(60, beamDir) * scaleFactor;
    draw_line_width_pix(x + xx + randX, y + yy + randY, x + xxa + randX, y + yya + randY, (blastThicc / 2) + bb);
    draw_line_width_pix(x + xx + randX, y + yy + randY, x + xxb + randX, y + yyb + randY, (blastThicc / 1.25) + bb);
    draw_set_alpha(1);
    gpu_set_depth(preDepth);
}

gpu_set_ztestenable(preZTest);
gpu_set_alphatestenable(preATest);
