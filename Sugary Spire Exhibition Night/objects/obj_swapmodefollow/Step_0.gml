event_inherited();

if visible && !global.swapmode
	visible = false

if !visible && global.swapmode
	visible = true

if global.playerCharacter = Characters.Pizzelle && spr_idle != spr_player_PN_idle{
	spr_idle = spr_player_PN_idle
	spr_run = spr_player_PN_walk
	spr_runpanic = spr_player_PN_walk
	spr_panic = spr_player_PN_idle_comboBig
	spr_appear = spr_player_PN_superTaunt_1
	spr_supertaunt = spr_player_PN_idle
	spr_taunt = spr_player_PN_tauntStills
	bigTaunt = true
	exit;
}

if global.playerCharacter = Characters.Pizzano && spr_idle != spr_player_PZ_idle{
	spr_idle = spr_player_PZ_idle
	spr_run = spr_player_PZ_walk
	spr_runpanic = spr_player_PZ_walk
	spr_panic = spr_player_PZ_idle_escape
	spr_appear = spr_player_PZ_superTaunt_1
	spr_supertaunt = spr_player_PZ_idle
	spr_taunt = spr_player_PZ_tauntStills
	bigTaunt = true
	exit;
}