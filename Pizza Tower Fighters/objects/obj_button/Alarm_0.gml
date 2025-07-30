if (actualname != name)
{
    actualname = string_copy(name, 1, string_length(actualname) + 2);
    alarm[0] = 1;
}

if (string_length(actualname) > string_length(name))
{
    actualname = name;
    alarm[0] = 1;
}
