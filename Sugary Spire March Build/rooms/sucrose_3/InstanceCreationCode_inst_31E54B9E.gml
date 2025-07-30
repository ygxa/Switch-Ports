condition = function() 
{
	return !instance_exists(inst_2D185551)
}

output = function() 
{
	if instance_exists(inst_4D98FDF3) {
		with (inst_4D98FDF3) {
			Region_active = false;
		}
	}
}