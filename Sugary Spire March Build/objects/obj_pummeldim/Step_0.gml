if obj_player.state = states.pizzanopummel || obj_player.state = states.frozen
fadealpha = approach(fadealpha, .75, .05)
else 
fadealpha = approach(fadealpha, -0.0000001, .05)
if fadealpha <= -0.0000001
instance_destroy()