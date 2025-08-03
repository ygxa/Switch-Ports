if (posing == 0 || reallyStillBounce || (stillBounce && obj_overworldui.currentCharacter == talkChar && instance_exists(obj_overworldui.writer) && !obj_overworldui.writer.isDone))
    bounceAmount = number_approach_smooth(bounceAmount, 1, 0.1);
else
    bounceAmount = number_approach_smooth(bounceAmount, 0, 0.2);

siner += 0.2;

if (siner >= (2 * pi))
    siner -= (2 * pi);

trans = 2 * bounceAmount * sin(siner);

if (otherActor != undefined)
{
    otherActor.x = otherActorX;
    otherActor.y = otherActorY + trans;
}
