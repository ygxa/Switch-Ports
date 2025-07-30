depth = 4;
//Flip flop Dashpad
initial_xscale = image_xscale;
if panic_flip == true && global.panic { //Edit this variable in the variables tab
	image_xscale *= -1
}
