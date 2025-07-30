with (obj_player)
{
  if state == states.cotton || state = states.cottondrill || state = states.cottonroll || state == states.flushed || (state == states.costumebreeze || state == states.costumechuck || state == states.costumenormal || state == states.costumegrab)
  {
	scr_sound(sfx_cottongone)
	state = states.normal
    sprite_index = spr_idle
	instance_create(x, y, obj_poofeffect)
    image_index = 0
  }
}