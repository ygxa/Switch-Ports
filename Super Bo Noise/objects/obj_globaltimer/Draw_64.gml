if ((!global.option_timer) || room == Realtitlescreen || room == rm_mainmenu || room == rm_levelselect || room == rank_room || instance_exists(obj_titlecard) || (!global.option_hud))
    return;
if (instance_exists(obj_pauseNew) && obj_pauseNew.state == (0 << 0) && (!global.option_timer_speedrun))
    return;
draw_set_color(c_white)
var seconds = 0
var minutes = 0
var s_str = ""
var m_str = ""
if (global.option_timer_type == 0)
{
    seconds = global.level_seconds
    minutes = global.level_minutes
}
else if (global.option_timer_type == 1 || global.option_timer_type == 2)
{
    seconds = global.file_seconds
    minutes = global.file_minutes
}
var timerArr = [self.makeString(minutes, seconds)]
if (global.option_timer_type == 2)
    array_push(timerArr, self.makeString(global.level_minutes, global.level_seconds))
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(global.timerfont)
draw_set_alpha(1)
draw_set_color(c_white)
var yy = 0
for (var i = array_length(timerArr) - 1; i > -1; i--)
{
    var finalstr = timerArr[i]
    draw_text((960 - (string_length(finalstr) - 1) * string_width("0")), (540 - 8 - yy), finalstr)
    yy += string_height("A")
}
