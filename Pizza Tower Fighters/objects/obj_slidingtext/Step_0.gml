timer--;
scaling = approach(scaling, (timer >= 0) ? 10 : 0, 1);

if (timer <= 0 && scaling == 0)
    instance_destroy();

if (instance_exists(ObjGame))
    instance_destroy();
