var px = x;
var py = y;
actor_shake_visual();

if (drawBat)
{
    batYOff = flightAmp * sin(step * flightFreq);
    step++;
    
    if ((step % 15) == 0)
        batImageIndex = !batImageIndex;
}
