var prevAsleepAmount = asleepAmount;

if (vasleep)
{
    asleepAmount += 0.1;
    
    if (asleepAmount > 1)
        asleepAmount = 1;
}
else
{
    asleepAmount -= 0.1;
    
    if (asleepAmount < 0)
        asleepAmount = 0;
}

if (prevAsleepAmount != asleepAmount)
{
    music_gain(1 - (asleepAmount * 0.1), 0);
    music_pitch(1 - (asleepAmount * 0.1));
}
