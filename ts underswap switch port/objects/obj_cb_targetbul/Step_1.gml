if (smallHitbox)
    mask_index = spr_cb_crossbonebul2_smallmask;
else if (largeHitbox)
    mask_index = spr_cb_crossbonebul2_bigmask;
else
    mask_index = spr_cb_crossbonebul2;

siner += bounceSpeed;

if (siner >= (2 * pi))
    siner -= (2 * pi);
