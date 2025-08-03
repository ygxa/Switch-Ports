if (charaShake < 3)
{
    if (charaShake == 0)
        charaStage++;
    
    charaShake++;
    alarm[8] = 2;
}
else
{
    charaShake = 0;
}
