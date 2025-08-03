siner += 0.1;

if (siner >= (2 * pi))
    siner -= (2 * pi);

if (vlowhp == 2)
{
    vlowhp = 3;
    
    with (obj_battlemanager)
        beginAttackMode();
}
