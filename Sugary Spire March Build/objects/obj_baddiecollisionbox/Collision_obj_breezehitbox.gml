if instance_exists(baddieID) && baddieID.state != baddiestate.stun && baddieID.invtime <= 0 {
	baddieID.vsp = -5
	baddieID.image_xscale = obj_player.xscale
	baddieID.hsp = 9
	baddieID.invtime = 10
	
	
}	