if (writer != -4 && writer.alpha > 0)
{
    writer.alpha -= 0.1;
    alarm[3] = 2;
}
else
{
    if (writer != -4)
    {
        instance_destroy(writer);
        writer = -4;
    }
    
    alarm[2] = 18;
}
