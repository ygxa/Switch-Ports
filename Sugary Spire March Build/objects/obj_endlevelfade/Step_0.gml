if (fadealpha > 1) {
    fadein = 1;
    if (room != rank_room) {
		room = rank_room;
		with (obj_player) {   
			x = other.PlayerX;
			y = other.PlayerY;
		}	
	}
}
if (fadein == 0) 
	fadealpha += 0.1;
else if (fadein == 1) 
	fadealpha -= 0.1;
with (obj_player) {
    if (room == rank_room && other.fadealpha <= 0) {	
		if distance_to_point(480, 270) > 2 {
			/*
			var _dir = point_direction(other.PlayerX, other.PlayerY, 480, 270);
			other.PlayerX += lengthdir_x(5, _dir);
			other.PlayerY += lengthdir_y(5, _dir);
			*/
			other.PlayerX = lerp(other.PlayerX, 258, 0.05);
			other.PlayerY = lerp(other.PlayerY, 269, 0.05);
		}
		else {
			other.PlayerX = 258;
			other.PlayerY = 269;			
		}
		x = other.PlayerX;
		y = other.PlayerY;			
    }
}
ini_close();
//obj_camera.visible = 0;
