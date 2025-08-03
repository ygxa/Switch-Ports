if (msgIndex > 19)
    msgIndex = 19;

var data = msgData[msgIndex];
obj_tattletail.image_speed = data[2];

if (data[3] != -1)
    sfx_play(data[3]);

with (instance_create_xy(180, 102, obj_floatingtext))
{
    str = dxd_raw("crys.mines_checkpoint_chatter." + other.msgData[other.msgIndex][0]);
    time = other.msgData[other.msgIndex][1];
}

if (msgIndex == 19)
    alarm[0] = 150;
else
    alarm[0] = 30 + data[1];

msgIndex++;
