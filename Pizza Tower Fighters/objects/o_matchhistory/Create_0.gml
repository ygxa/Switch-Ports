ini_open("Matches.ini");
nomatches = 0;
number_of_matches = ini_read_real("generalinfo", "curmatch", 0);

if (number_of_matches == 0)
    nomatches = true;

matchmax = number_of_matches;
ini_close();
ylast = -100;
ymax = 500;
selected = 0;
