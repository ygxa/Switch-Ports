function scr_painterdemodialogue()
{
	var secret_count = 0
	var levels = ["entryway", "steamy", "mineshaft", "molasses"]
	var molasses_secrets = 0
	ini_open(global.SaveFileName)
	
	for (var i = 0; i < array_length(levels); i++)
	{
		for (var j = 0; j < 3; j++)
		{
			var secret_collected = ini_read_real("Secret", levels[i] + string(j + 1), 0) ? 1 : 0
			secret_count += secret_collected
			
			if (levels[i] == "molasses")
				molasses_secrets += secret_collected
		}
	}
	
	fixed_ini_close()
	//eas_save(scr_easyasync_callback)
	var info_arr = []
	talk_sound = "event:/SFX/hub/painterThink"
	var dialogue_key
	
	if (room == hub_molasses)
	{
		if (scr_check_completion())
		{
			dialogue_key = "Zzz... A starving artist like me needs his beauty sleep too..."
			idle = spr_painteridle7
			speak = spr_painteridle7
			talk_sound = -4
		}
		else if (molasses_secrets >= 3)
		{
			if (irandom(1) == 0)
			{
				dialogue_key = "Hmm... My beautiful The Frog, at last you have been restored to your former glory! I promise never to take my eye off of you again..."
				idle = spr_painteridle
				speak = spr_painteridle
			}
			else
			{
				dialogue_key = "Hmm... I'm impressed to see such refinement to your tastes, confiseur. You know, this piece is my Magnum Oculus, so I'm not surprised that you gravitated towards it so strongly."
				idle = spr_painteridle5
				speak = spr_painteridle5
				talk_sound = snd_painterhappy
			}
		}
		else
		{
			dialogue_key = "No! Not The Frog too! Now all of my paintings are ruined..."
			idle = spr_painteridle6
			speak = spr_painteridle6
			array_push(info_arr, scr_getDialogIcon("INK"))
			talk_sound = snd_paintersad
		}
	}
	else if (secret_count == 0)
	{
		if (global.NewFile)
		{
			dialogue_key = "Hmm... You are the one who scattered my precious /1 INK! The Critics are already en route... you had better bring my INK back to me before they arrive."
			idle = spr_painteridle1
			speak = spr_painteridle1
			array_push(info_arr, scr_getDialogIcon("INK"))
			talk_sound = snd_painterangry
		}
		else
		{
			dialogue_key = "Hmm... My patience is shrinking, tiny candy lady. Find my /1 INK."
			idle = spr_painteridle1
			speak = spr_painteridle1
			array_push(info_arr, scr_getDialogIcon("INK"))
			talk_sound = snd_painterangry
		}
	}
	else if (secret_count > 0 && secret_count < 3)
	{
		dialogue_key = "Hmm... I see you have started to return some of my /1 INK, but there is still more left. There is little time for us to chit the chat, I'm afraid, I'm much too busy preparing the show..."
		idle = spr_painteridle1
		speak = spr_painteridle1
		talk_sound = snd_painterangry
		array_push(info_arr, scr_getDialogIcon("INK"))
	}
	else if (secret_count < 6)
	{
		dialogue_key = "Hmm... Did you see them? Look at their beady little eyes... They think they can critique me? MOI? Hmph."
		idle = spr_painteridle2
		speak = spr_painteridle3
		talk_sound = snd_painterangry
		array_push(info_arr, scr_getDialogIcon("INK"))
	}
	else if (secret_count < 9)
	{
		dialogue_key = "Hmm... You're halfway there, confiseur, but please hurry. If they are kept waiting any longer, the Critics are sure to pen a scathing critique of me in one of those free magazines you find on airplanes..."
		idle = spr_painteridle
		speak = spr_painteridle
	}
	else if (secret_count < 12)
	{
		dialogue_key = "Hmm... Perhaps I judged you too harshly, confiseur. The Critics seem to appreciate your roguish smile and lovable antics..."
		idle = spr_painteridle4
		speak = spr_painteridle4
	}
	else if (secret_count == 12)
	{
		dialogue_key = "Hmm... Finally, you've recovered all of my # INK! Please, mademoiselle, enjoy the show."
		idle = spr_painteridle5
		speak = spr_painteridle5
		array_push(info_arr, scr_getDialogIcon("INK"))
	}
	else
	{
		dialogue_key = "Hmm... There is something to be said for the strange connection which any interactive art has to its host medium. Even the most well-preserved copy of Madden NFL 2001 is only as good as the PlayStation 2 upon which it runs, or as pure as the intentions of one who runs it... You understand, right?"
	}
	
	if (dialogue_key != "Hmm... You are the one who scattered my precious /1 INK! The Critics are already en route... you had better bring my INK back to me before they arrive." && dialogue_key != "Hmm... There is something to be said for the strange connection which any interactive art has to its host medium. Even the most well-preserved copy of Madden NFL 2001 is only as good as the PlayStation 2 upon which it runs, or as pure as the intentions of one who runs it... You understand, right?" && global.UseOfftopic && irandom(2) == 0 && room != hub_molasses)
	{
		if (global.SaveMinutes >= 60)
		{
			if (secret_count == 12)
			{
				dialogue_key = "Hmm... You may have bought a ticket, Confiseur, but you are only owed 60 short minutes from moi. Your unhelpful behind had better make itself scarce before someone notices that your time is up..."
				idle = spr_painteridle5
				speak = spr_painteridle5
				talk_sound = snd_painterhappy
			}
			else
			{
				dialogue_key = "Hmm... Your time at the exhibition may have expired, Confiseur, but I implore you to enjoy the art for as long as you wish! You have done me a great service, and it is no shellac off my back if you wish to stay a little longer."
				idle = spr_painteridle2
				speak = spr_painteridle3
				talk_sound = snd_painterangry
				array_push(info_arr, scr_getDialogIcon("INK"))
			}
		}
		
		if ((current_month == 12 && current_day == 31 && current_year == 2024) || (current_month == 1 && current_day == 1 && current_year == 2025))
		{
			dialogue_key = "Hmm... I don't really understand what all the fuss is about. I can hardly see anything through these glasses..."
			idle = spr_painteridle_newyears
			speak = spr_painteridle_newyears
			talk_sound = snd_painterangry
		}
		else if (current_month == 2 && current_day == 14)
		{
			dialogue_key = "Hmm... All the cards at the store say things like \"I love you\" and \"You're special.\" Where's the card that says \"I admire your original compositions and appreciate their deeper subtextual meaning?\" I wish someone would get me one of those instead..."
			idle = spr_painteridle2
			speak = spr_painteridle3
			talk_sound = snd_paintersad
		}
	}
	
	return lang_get(dialogue_key, info_arr);
}
