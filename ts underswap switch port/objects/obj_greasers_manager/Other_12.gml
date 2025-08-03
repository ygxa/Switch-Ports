var m = obj_moldrick_monster.isActive;
var a = obj_aaxel_monster.isActive;
var n = obj_norman_monster.isActive;

if (first && m && a && n)
{
    obj_moldrick_monster.vspeech = 0;
    obj_aaxel_monster.vspeech = -3;
    obj_norman_monster.vspeech = 0;
    first = false;
}
else
{
    obj_moldrick_monster.vspeech = -1;
    obj_aaxel_monster.vspeech = (m || n) ? -1 : -2;
    obj_norman_monster.vspeech = -1;
    var r = irandom(4);
    
    if (a && obj_aaxel_monster.vdistraught)
        r = 4;
    
    if (r <= 1 && a && n)
    {
        obj_aaxel_monster.vspeech = r;
        obj_norman_monster.vspeech = r + 1;
    }
    else if (r == 2 && a && m)
    {
        obj_aaxel_monster.vspeech = 2;
        obj_moldrick_monster.vspeech = 2;
    }
}

if (m)
{
    if (obj_moldrick_monster.vcalloutdid)
    {
        obj_moldrick_monster.vcalloutdid = false;
        
        if (!obj_moldrick_monster.angry)
            obj_moldrick_monster.vspeech = 5;
        else
            obj_moldrick_monster.vspeech = 2 + obj_moldrick_monster.vcallout;
        
        obj_aaxel_monster.vspeech = -1;
        obj_norman_monster.vspeech = -1;
    }
    else if (obj_moldrick_monster.vimitatedid)
    {
        obj_moldrick_monster.vimitatedid = false;
        obj_moldrick_monster.vspeech = 6 + obj_moldrick_monster.vimitate;
        obj_aaxel_monster.vspeech = -1;
        obj_norman_monster.vspeech = -1;
    }
}

if (a)
{
    if (obj_aaxel_monster.vflexdid)
    {
        obj_aaxel_monster.vflexdid = false;
        obj_aaxel_monster.vspeech = 2 + obj_aaxel_monster.vflex;
        obj_moldrick_monster.vspeech = -1;
        obj_norman_monster.vspeech = -1;
    }
    else if (obj_aaxel_monster.vinsultdid)
    {
        obj_aaxel_monster.vinsultdid = false;
        
        if (obj_aaxel_monster.vdistraught)
            obj_aaxel_monster.vspeech = 9;
        else
            obj_aaxel_monster.vspeech = 6 + obj_aaxel_monster.vinsult;
        
        obj_moldrick_monster.vspeech = -1;
        obj_norman_monster.vspeech = -1;
    }
    else if (obj_aaxel_monster.vlunchmoney)
    {
        obj_aaxel_monster.vlunchmoney = false;
        obj_aaxel_monster.vspeech = 10 + obj_aaxel_monster.vmoneystate;
        obj_moldrick_monster.vspeech = -1;
        obj_norman_monster.vspeech = -1;
    }
}

if (n)
{
    if (obj_norman_monster.vintimidatedid)
    {
        obj_norman_monster.vintimidatedid = false;
        obj_norman_monster.vspeech = 2 + obj_norman_monster.vintimidate;
        obj_moldrick_monster.vspeech = -1;
        obj_aaxel_monster.vspeech = -1;
    }
    else if (obj_norman_monster.vdistractdid)
    {
        obj_norman_monster.vdistractdid = false;
        obj_norman_monster.vspeech = 5 + (obj_norman_monster.vdistracted ? 1 : 0);
        obj_moldrick_monster.vspeech = -1;
        obj_aaxel_monster.vspeech = -1;
    }
    else if (obj_norman_monster.vrevealdid)
    {
        obj_norman_monster.vrevealdid = false;
        obj_norman_monster.vspeech = 7 + (obj_norman_monster.vdistracted ? 1 : 0);
        obj_moldrick_monster.vspeech = -1;
        obj_aaxel_monster.vspeech = -1;
    }
}
