function scr_completion_percent(arg0)
{
	if (file_exists(arg0))
	{
		ini_open(arg0)
		var levels = ["entryway", "steamy", "mineshaft", "molasses"]
		var ranks = ["d", "c", "b", "a", "s"]
		var levels_count = 0
		var confecti_count = 0
		var secret_count = 0
		var task_count = 0
		var rank_count = 0
		var p_rank_count = 0
		var treasure_count = 0
		var completed_tutorial = ini_read_real("Misc", "completedtutorial", 0)
		
		for (var i = 0; i < array_length(levels); i++)
		{
			if (ini_key_exists("Highscore", levels[i]))
				levels_count++
			
			var rank = ini_read_string("Ranks", levels[i], "d")
			
			if (rank == "p")
			{
				rank_count += 4
				p_rank_count++
			}
			else
			{
				rank_count += array_get_index(ranks, rank)
			}
			
			for (var j = 0; j < 5; j++)
			{
				if (ini_read_real("Confecti", levels[i] + string(j + 1), 0))
					confecti_count++
			}
			
			for (var j = 0; j < 3; j++)
				secret_count += (ini_read_real("Secret", levels[i] + string(j + 1), 0) ? 1 : 0)
			
			if (ini_read_real("Treasure", levels[i], 0))
				treasure_count++
			
			var tasks = scr_get_chef_tasks(levels[i], false)
			
			for (var j = 0; j < array_length(tasks); j++)
			{
				if (ini_read_real("ChefTasks", tasks[j].taskKey, 0))
					task_count++
			}
		}
		
		fixed_ini_close()
		var completion = 0
		completion += (1 * completed_tutorial)
		completion += ((9 * levels_count) / 4)
		completion += ((10 * rank_count) / 16)
		completion += ((20 * confecti_count) / 20)
		completion += ((30 * secret_count) / 12)
		completion += ((20 * treasure_count) / 4)
		completion += ((10 * task_count) / 12)
		completion += ((1 * p_rank_count) / 4)
		return floor(completion);
	}
	else
	{
		return 0;
	}
	return 0;
}

function scr_check_completion(arg0 = global.SaveFileName)
{
	var levels = ["entryway", "steamy", "mineshaft", "molasses"]
	var count = 0
	ini_open(arg0)
	
	for (var i = 0; i < array_length(levels); i++)
	{
		var rank = ini_read_string("Ranks", levels[i], "none")
		
		if (rank != "none")
			count++
	}
	
	fixed_ini_close()
	return count >= array_length(levels);
}
