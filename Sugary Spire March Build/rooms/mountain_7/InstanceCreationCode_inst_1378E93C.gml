condition = function() 
{
	return !instance_exists(inst_4F4D35D7)
}

output = function() 
{
	if instance_exists(inst_2CE104E) {
		with (inst_2CE104E) {
			Region_active = false;
		}
	}
}