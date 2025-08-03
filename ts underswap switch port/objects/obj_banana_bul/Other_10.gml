if (!sliding)
{
    if (!didHeal)
        event_inherited();
    
    if (damageAmount < 0)
        didHeal = true;
}
