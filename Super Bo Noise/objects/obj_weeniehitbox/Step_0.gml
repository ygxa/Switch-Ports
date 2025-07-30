if (!instance_exists(baddieID) || baddieID.state != 7)
{
    instance_destroy();
    exit;
}

x = baddieID.x;
y = baddieID.y;
image_xscale = baddieID.image_xscale;
