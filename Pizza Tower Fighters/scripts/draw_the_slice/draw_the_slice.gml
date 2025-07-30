function draw_the_slice(argument0, argument1, argument2, argument3, argument4, argument5)
{
    var cellSize = sprite_get_width(argument4) / 3;
    var mainW = argument2 - (cellSize * 2);
    var mainH = argument3 - (cellSize * 2);
    var mainScaleW = mainW / cellSize;
    var mainScaleH = mainH / cellSize;
    draw_sprite_part(argument4, argument5, 0, 0, cellSize, cellSize, argument0, argument1);
    draw_sprite_part(argument4, argument5, cellSize * 2, 0, cellSize, cellSize, (argument0 + argument2) - cellSize, argument1);
    draw_sprite_part(argument4, argument5, 0, cellSize * 2, cellSize, cellSize, argument0, (argument1 + argument3) - cellSize);
    draw_sprite_part(argument4, argument5, cellSize * 2, cellSize * 2, cellSize, cellSize, (argument0 + argument2) - cellSize, (argument1 + argument3) - cellSize);
    draw_sprite_part_ext(argument4, argument5, cellSize, cellSize, cellSize, cellSize, argument0 + cellSize, argument1 + cellSize, mainScaleW, mainScaleH, -1, 1);
    draw_sprite_part_ext(argument4, argument5, cellSize, 0, cellSize, cellSize, argument0 + cellSize, argument1, mainScaleW, 1, -1, 1);
    draw_sprite_part_ext(argument4, argument5, cellSize, cellSize * 2, cellSize, cellSize, argument0 + cellSize, (argument1 + argument3) - cellSize, mainScaleW, 1, -1, 1);
    draw_sprite_part_ext(argument4, argument5, 0, cellSize, cellSize, cellSize, argument0, argument1 + cellSize, 1, mainScaleH, -1, 1);
    draw_sprite_part_ext(argument4, argument5, cellSize * 2, cellSize, cellSize, cellSize, (argument0 + argument2) - cellSize, argument1 + cellSize, 1, mainScaleH, -1, 1);
}
