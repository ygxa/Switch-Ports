/// @description Explosive End.
instance_create(x + (sprite_width/2), y + (sprite_height/2), obj_bombexplosionharmless);

var rep = 7 + ((sprite_width/32) - 1);
repeat(rep)
   with instance_create(x + (sprite_width/2), y + (sprite_height/2), obj_debris) {
	sprite_index = spr_bombblockdebris;
}
camera_shake(20, 40);
#region More Debris
var i = 0;
repeat(5) {
	with instance_create(x + (sprite_width/2), y + (sprite_height/2), obj_debris)
	{
		sprite_index = spr_gnomewalldebris
		image_index = i
	}
	i++;
}

#endregion
instance_destroy();