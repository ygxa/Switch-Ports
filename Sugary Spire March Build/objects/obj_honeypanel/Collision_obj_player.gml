if (active && other.state != states.honey && other.state != states.frozen && other.state != states.hurt && other.state != states.bump)
{
	with other {
		if state == states.climbwall state = states.mach2
		scr_taunt_storeVariables()
		state = states.honey
		webID = other.id
	}
	
	//scr_controlprompt(concat(prompt_string(global.key_jump), "Jump ", prompt_string(global.key_slap), "Drop ", prompt_string(global.key_left), prompt_string(global.key_right), " Turn"))
}
