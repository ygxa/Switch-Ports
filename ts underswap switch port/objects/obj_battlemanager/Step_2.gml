var karma = statsKarmaHandler != undefined;

if (karma)
    statsKarmaHandler.tick();

if (drawStats)
{
    if (compactStats)
    {
        global.dxformat[0] = _string(global.playerlv);
        statsText = format_text_interpolate(cachedStatsText);
    }
    else
    {
        global.dxformat[0] = global.playername;
        global.dxformat[1] = _string(global.playerlv);
        statsText = format_text_interpolate(cachedStatsText);
    }
    
    if (global.playerhp <= 9)
        global.dxformat[0] = _string("0{0}", global.playerhp);
    else
        global.dxformat[0] = _string(global.playerhp);
    
    global.dxformat[1] = _string(global.playermaxhp);
    statsHP = format_text_interpolate(cachedHPText);
    statsHPWidth = floor(global.playermaxhp * 1.65);
    statsHPWidth2 = floor(min(global.playerhp, global.playermaxhp) * 1.65);
    
    if (karma)
    {
        statsHPKarmaWidth = statsKarmaHandler.karma * 1.65;
        statsHPKarmaOff = floor((min(global.playerhp, global.playermaxhp) * 1.65) - (statsKarmaHandler.karma * 1.65));
        statsHPKarmaWidth = min(ceil(statsHPKarmaWidth), statsHPWidth - statsHPKarmaOff);
    }
}
