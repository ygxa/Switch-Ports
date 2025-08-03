y = max(obj_hitthetarget.borderTop + 90, y - (min(obj_htt_bulgen.intensity, 20) / 6));

if (obj_dateheart.y > (y + 8))
{
    with (obj_dateheart)
        damage(other);
}
