if (place_meeting(x, y, obj_player) && condition())
{
    trigger_news(texts, tvs);
    instance_destroy();
}
