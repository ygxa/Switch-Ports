vignetteSiner += 0.03;

if (vignetteSiner >= (2 * pi))
    vignetteSiner -= (2 * pi);

if (followX != undefined)
{
    with (obj_player)
    {
        other.followX = number_approach_smooth(other.followX, x, 0.18, 0.5);
        other.followY = number_approach_smooth(other.followY, y, 0.18, 0.5);
    }
}
