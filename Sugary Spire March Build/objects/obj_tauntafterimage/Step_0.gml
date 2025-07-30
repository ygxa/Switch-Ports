if !global.freezeframe {
	if vanish = 1
	{	
		if gonealpha > 0
			gonealpha -= 0.15
		else if	gonealpha <= 0
			instance_destroy()
	}
	visible = playerID.visible
	//Real Color
	with (realcol) {
		switch (other.color) {
			case 1: //Blue
			//Main Color		
			r = 48;
			g = 168;
			b = 248;
			//Black Lines
			r2 = 15;
			g2 = 57;
			b2 = 121;
			break;
			case 2: //Red
			//Main Color
			r = 232;
			g = 80;
			b = 152;		
			//Black Lines		
			r2 = 95;
			g2 = 9;
			b2 = 32;		
			break;		
		}
	}
	
	x += hsp;
	y += vsp;
}
