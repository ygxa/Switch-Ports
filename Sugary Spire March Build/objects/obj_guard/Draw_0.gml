/*//Variables
var drawx = x;
var drawy = y;
if tauntBuffer {
	drawx += irandom_range(-1, 1);
	drawy += irandom_range(-1, 1);
}
if squashedy = true
{
var xscale = image_yscale - squashvaly;
var yscale = (abs(image_xscale) + (squashvaly)) * sign(image_xscale);
}
else
{
var xscale = (abs(image_xscale) + (squashvalx)) * sign(image_xscale);
var yscale = image_yscale - squashvalx;
}

pal_swap_set(spr_palette, paletteselect, false);
#region Draw Enemy
draw_sprite_ext(sprite_index, image_index, drawx + (46 * squashvaly), drawy + (46 * squashvalx), xscale, yscale, image_angle, image_blend, image_alpha);

if flash {
    draw_sprite_ext_flash(sprite_index, image_index, drawx + (46 * squashvaly), drawy + (46 * squashvalx), xscale, yscale, image_angle, c_white, image_alpha);
}

if cottoned {
	draw_sprite_ext_flash(sprite_index, image_index, drawx + (46 * squashvaly), drawy + (46 * squashvalx), xscale, yscale, image_angle, #FF8AFE, 0.6);
}
#endregion
pal_swap_reset();
if global.debugmode = 1
{
	draw_set_font(font_dev);
	draw_text(x, y - 50, state);
	draw_text(x, y - 150, movespeed);
	if object_index = obj_cottonwitch
	{
		draw_text(x, y - 100, bombreset);	
	}
	if object_index = obj_sluggy
	{
		draw_text(x, y - 100, idletimer);	
		draw_text(x, y - 150, jumptimer);	
	}
	if object_index = obj_creamtheifOLD
	{
		draw_text(x, y - 100, snatchcooldown);	
		
	}
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1);	

}

draw_sprite_ext(spr_guardspothitbox, 0, (x + 100 * image_xscale), y, -image_xscale, image_yscale, 0, 0, 0.5)
draw_rectangle(x - 150 * -sign(image_xscale), y + 80, x  - 50  * -sign(image_xscale), y - 80, true);