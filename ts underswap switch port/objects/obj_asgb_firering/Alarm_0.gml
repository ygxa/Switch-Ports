var totalBullets = bulletsPerRing - gap;
var gapStart = irandom_range(0, totalBullets);
var count = 0;
var i = gapStart + gap;

while (i < gapStart || i >= (gapStart + gap))
{
    if (i >= bulletsPerRing)
        i = 0;
    
    var angle = (i / bulletsPerRing) * pi * 2;
    var bulX = centerX + (cos(angle) * radius);
    var bulY = centerY + (sin(angle) * radius);
    var bullet = bt_bullet_attack(obj_asgbul_ringbul, damageAmount, bulX, bulY);
    bullet.ringParent = id;
    bullet.direction = point_direction(bulX, bulY, centerX, centerY);
    bullet.speed = shrinkSpeed;
    bullet.alarm[0] = max(1, floor(16 * (count++ / totalBullets)));
    i++;
}

alarm[0] = ringDelay;
