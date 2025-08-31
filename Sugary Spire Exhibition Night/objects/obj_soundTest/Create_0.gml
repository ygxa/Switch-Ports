currentSelection = 0
savedSelection = 0
pauseStatus = false
specialToggle = false
musicPlaying = false

defineMusic = function(arg0, arg1, arg2, arg3 = "", arg4 = undefined)
{
	var o = {
		eventPath:		arg0,
		eventInstance:	arg0,
		songDescription:arg1,
		songComposer:	arg2,
		hasSpecial:		(arg3 != ""),
		specialDesc:	arg3,
		specialComposer:is_undefined(arg4) ? arg2 : arg4
	};
	
	array_push(musicArray, o);
	return o;
}


musicArray = []
defineMusic("no", "Art Curse", "Paperkitty")
defineMusic(mu_titlescreen, "Exhibition Night", "Stewart Keller");
defineMusic(mu_hub1, "Good Morning", "Stewart Keller")
defineMusic(mu_options, "Pick Your Poison", "Stewart Keller")
defineMusic(mu_pausesoundtest, "Earth.", "CableChords")
defineMusic(mu_tutorial, "Family Friendly", "PaperKitty")
defineMusic("event:/music/Soundtest/harry", "Arkoudaphobia", "Stewart Keller")
defineMusic(mu_entryway, "Down To Noise", "RodMod")
defineMusic("event:/music/Soundtest/entrywayPZ_secret", "there's a secret inside my breakfast?", "Various")
defineMusic(mu_steamy, "Steamy Cotton Candy", "RodMod", "Werecotton Mix")
defineMusic("event:/music/Soundtest/cottontownB", "Around The Gateau's Gears", "RodMod", "Werecotton Mix")
defineMusic("event:/music/Soundtest/cottontown_secret", "Lookie! You've found a steamy surprise.", "Various")
defineMusic(mu_mineshaft1, "Mineshaft Depths", "RodMod", "Minecart Mix", "RodMod, Pteracotta")
defineMusic("event:/music/Soundtest/minesB", "Cobalt Catastrophe", "RodMod", "Minecart Mix", "RodMod, Pteracotta")
defineMusic("event:/music/Soundtest/mines_secret", "a jawbreaking secret.", "Various")
defineMusic(mu_molasses, "Lost Chocolate", "CableChords, RodMod", "Focus Mix")
defineMusic("event:/music/Soundtest/molassesB", "Found Chocolate", "CableChords", "Focus Mix")
defineMusic("event:/music/Soundtest/molasses_secret", "man's lost secret.", "Various")
defineMusic(mu_escape, "Sugar Rush", "RodMod, CableChords, The8Bitdrummer")
defineMusic("event:/music/Soundtest/sweetrelease", "Sweet Release of Death", "RodMod")
defineMusic(mu_ranknormal, "Results!", "PaperKitty", "AWFUL Mix")
defineMusic("event:/music/Soundtest/credits", "Toodle-oo!", "PaperKitty")
ini_open(global.SaveFileName)

if (ini_read_string("Game", "Judgment", "none") != "none")
	defineMusic(mu_painterbrain, "Painter's Brain", "Stewart Keller")

if (ini_read_string("Treasure", "mindpalace", "0") != "0")
{
	defineMusic("event:/music/Soundtest/painterMixtape", "Painter's Mixtape", "Stewart Keller, HyperTem", "OST Mix", "Stewart Keller")
	defineMusic("event:/music/Soundtest/spiresamba", "Samba de Spire", "PaperKitty")
	defineMusic("event:/music/Soundtest/mountainA", "Aw, Fudge! (Bonus)", "Pteracotta")
	defineMusic("event:/music/Soundtest/mountainB", "Fudge It All! (Bonus)", "RodMod")
	defineMusic("event:/music/Soundtest/mountain_secret", "what the fudge? it's a secret! (Bonus)", "Various")
	defineMusic("event:/music/Soundtest/runthedog", "Run the Dog (Bonus)", "PaperKitty", "Marshmallow Mix")
	defineMusic("event:/music/Soundtest/sugarcubehailstorm", "Sugarcube Hailstorm (Bonus)", "PaperKitty")
	defineMusic("event:/music/Soundtest/painterBoss", "Painter's Theme (Bonus)", "CableChords")
	defineMusic("event:/music/Soundtest/stinky", "What's that Smell? (Bonus)", "PaperKitty")
}

fixed_ini_close()
