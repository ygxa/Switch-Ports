if (!instance_exists(follow))
{
    instance_destroy();
    exit;
}

x = follow.x;
y = follow.y - 24;
visible = true;
