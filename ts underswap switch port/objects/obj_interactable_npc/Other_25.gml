switch (lookDirection)
{
    case 1:
        if (spriteDown != -1)
            sprite_index = spriteDown;
        
        break;
    
    case 2:
        if (spriteLeft != -1)
            sprite_index = spriteLeft;
        
        break;
    
    case 0:
        if (spriteUp != -1)
            sprite_index = spriteUp;
        
        break;
    
    case 3:
        if (spriteRight != -1)
            sprite_index = spriteRight;
        
        break;
}
