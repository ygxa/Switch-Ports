state = (2 << 0);
i = 0;
savetitle = "Demo.demrec";
saveto = "Demos/" + savetitle;
length = 0;
p1mem = [[]];
p2mem = [];
p3mem = [];
prevstate = 0;
alarm[0] = 1;
depth = -999;
l = 0;

while (audio_exists(l))
    l++;
