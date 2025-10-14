hurryUp = input_check("attack")
if (credTime < (array_length(creditArr) - 1))
    credTime += (creditSpeed * (hurryUp ? 4 : 1))
creditIndex = clamp(floor(credTime), -1, (array_length(creditArr) - 2))
for (var i = 0; i < array_length(creditArr); i++)
{
    with (creditArr[i])
        self.step()
}
if (creditIndex >= (array_length(creditArr) - 2) || input_check("start"))
{
    endAlpha = approach(endAlpha, 1, 0.005)
    if (input_check("jump") || input_check("start"))
    {
        if (final && finaleBuffer <= 0)
        {
            if completed
                mail_trigger((21 << 0))
            with (obj_player1)
            {
                targetRoom = hub_world1
                targetDoor = "F"
                state = (100 << 0)
                visible = true
            }
            instance_create(0, 0, obj_fadeout)
        }
        else
            final = true
    }
    if (final && finalAlpha < 1)
        finalAlpha = approach(finalAlpha, 1, 0.005)
    else if (finalAlpha >= 1)
        finaleBuffer--
    if input_check("start")
    {
        finaleBuffer = 0
        final = true
    }
}
var mousex = device_mouse_x_to_gui(0)
var mousey = device_mouse_y_to_gui(0)
var mouseleft = mouse_check_button_pressed(mb_left)
var mouseright = mouse_check_button_pressed(mb_right)
with (obj_cursorSpecial)
{
    if active
    {
        mousex = x
        mousey = y
        mouseleft = clickedL
        mouseright = clickedR
    }
}

if (!final)
{
    if (tomatoBuffer > 0)
        tomatoBuffer -= (hurryUp ? 4 : 1)
    if (tomatoBuffer <= 0 && mouseleft)
    {
        self.addTomato(mousex, mousey)


        tomatoBuffer = 20
    }
}

if (!final)
{
    if (cheerBuffer > 0)
        cheerBuffer -= (hurryUp ? 4 : 1)
    if (cheerBuffer <= 0 && mouseright)
    {
        self.addCheer(mousex, mousey)

        cheerBuffer = 20
    }
}
