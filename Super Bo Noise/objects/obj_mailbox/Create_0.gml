sWidth = 544;
sHeight = 448;
scrollY = 0;
messagePadX = 104;
messagePadY = 8;
selected = 0;
scrollpos = 0;
newmessage = false;
obtainedMail = [];
current_message = "";
envelope_xscale = 1;
envelope_yscale = 1;
gui_pos = 
{
    x: (global.resolutions[0][1][0] - sWidth) / 2,
    y: global.resolutions[0][1][1] + 32,
    xstart: (global.resolutions[0][1][0] - sWidth) / 2,
    ystart: global.resolutions[0][1][1] + 32
};
letter_pos = 
{
    x: messagePadX,
    y: sHeight + 32,
    xstart: messagePadX,
    ystart: messagePadY
};
bg_pos = 
{
    x: 0,
    y: 0
};
bg = bg_mailbox;
mailSurf = surface_create(sWidth, sHeight);
font = global.grannyfont;
showMail = true;
xpad = 64;
image_speed = 0;
idleSpr = spr_mailbox;
openSpr = spr_mailbox_open;
mask_index = spr_grannygrape;
mailsnd = fmod_createEventInstance("event:/SFX/ui/gotmail");
