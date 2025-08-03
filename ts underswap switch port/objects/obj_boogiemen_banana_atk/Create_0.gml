event_inherited();
damageAmount = 4;
bananaLengthCheck = 85;
spawnChance = 0.6;
spawnRate = 40;
healNum = choose(1, 2);
bananaCount = 0;
alarm[0] = 1;
alarm[1] = floor(spawnRate / 2) + 1;
person_speed = 4;

if (instance_exists(obj_koffink_monster))
{
    separation = obj_battleheart_purple.rowSep;
}
else
{
    separation = 30;
    alarm[2] = 1;
}

num_sections = floor((obj_battlemanager.boxY2 - obj_battlemanager.boxY1) / separation);

if ((num_sections % 2) == 0)
    num_sections--;

if (num_sections < 1)
    num_sections = 1;

sections = array_create(num_sections, false);
var diff = 0;
var side = irandom(1);

if (instance_exists(obj_koffink_monster) && obj_koffink_monster.attackType == 11)
    side = 0;

var middle = (obj_battlemanager.boxY1 + obj_battlemanager.boxY2) / 2;
var middle_index = floor(num_sections / 2);

while (diff <= middle_index)
{
    sections[middle_index + diff] = [side, middle + (separation * diff)];
    
    if (diff > 0)
        sections[middle_index - diff] = [side, middle - (separation * diff)];
    
    side = 1 - side;
    diff++;
}
