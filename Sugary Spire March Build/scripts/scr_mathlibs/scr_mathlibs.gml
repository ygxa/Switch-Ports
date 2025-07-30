// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mathlibs(){

function cycle(argument0, argument1, argument2)
{
	var delta = (argument2 - argument1)
	var result = ((argument0 - argument1) % delta)
	if (result < 0)
		result += delta
	return (result + argument1);
}

function angle_rotate(argument0, argument1, argument2)
{
	var diff = cycle((argument1 - argument0), -180, 180)
	if (diff < (-argument2))
		return (argument0 - argument2);
	if (diff > argument2)
		return (argument0 + argument2);
	return argument1;
}

}