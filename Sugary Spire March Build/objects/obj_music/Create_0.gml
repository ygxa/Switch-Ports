global.music_map = ds_map_create()
global.secret_room = false
global.secretmusic = -4
/// @desc Function Description
/// @param {Asset.GMRoom} room The Room to change music in.
/// @param {Asset.GMSound} song The main level song.
/// @param {Asset.GMSound} secret_song The secret song.
/// @param {bool} continuous Boolean to toggle between continuous syncing between tracks.
/// @param {function} function Function to handle advanced music switches.
function add_music(rm, song, secret_song, cont, func = undefined) {
	var b = {
		music : song,
		secret_music : secret_song,
		continuous : cont,
		my_func : func,
	}
	global.music_map[? rm] = b
}
museffect = 0
pausedmusic = 0;
prevmuID = -4
target_gain = 1

contTrack_pos = 0;
GummyBear = false;
music = undefined
// How to change Escape Music
// By default, the escape themes are the character's respective escape themes, but changing the escapemusic variable will override those from playing
// To set escape theme, simply set the escape music variable to whichever song you choose 
// For escape theme loops, do [escape music, loop start, loop end]
escapemusic = -4
default_escapemusic = mu_escape
musicGain = 1
force_continuous = false;
unforce_continuous = false;
ignore_change = false;
hard_force = false;
musicfadein = 0

// Room to change, Normal Music, Secret Music, Continuous, Loop Begin, Loop End (undefined is default)
room_details = {
	music : noone,
	secret_music : noone,
	continuous : false,
	my_func : undefined,
}
add_music(rm_disclaimer, mu_gummyharry, mu_painter, 0)
add_music(rm_introVideo, noone, mu_painter, 0)
add_music(devroom, mu_what, mu_painter, 0)
add_music(rm_missing, mu_void, mu_painter, 0)
add_music(realtitlescreen, mu_title, mu_painter, 0)
add_music(hub_w1, mu_hubw1, mu_painter, 1)
add_music(hub_w2, mu_hubw2, mu_painter, 1)
add_music(rm_credits, mu_credits, mu_painter, 0)
add_music(tutorial_1, mu_tutorial, mu_painter, 0)
//add_music(tutorial_10, mu_tutorial, mu_painter, 0)
add_music(entryway_1, mu_waffle, mu_wafflesecret, 0)
add_music(steamy_1, mu_steamy, mu_steamysecret, 0)
add_music(steamy_7, mu_steamy, mu_steamysecret, 1)
add_music(steamy_8, mu_steamyinner, mu_steamysecret, 1)
add_music(molasses_1, mu_swamp1, mu_swampsecret, 0)
add_music(molasses_6, mu_swamp1, mu_swampsecret, 1)
add_music(molasses_6b, mu_swamp2, mu_swampsecret, 1)
add_music(mines_1, mu_mineshaft1, mu_minessecret, 0, function() {
	if (global.minesProgress && obj_player.state == states.victory) { return mu_void; }
	else if (global.minesProgress) { return mu_mineshaft2; }
	else { return mu_mineshaft1; }
});
add_music(mines_6, mu_mineshaft2, mu_minessecret, 0)
add_music(mineshaft_1, mu_mineshaft1, mu_minessecret, 0);
add_music(mountain_intro, mu_mountain1, mu_mountainsecret, 0)
add_music(mountain_5, mu_mountain1, mu_mountainsecret, 1)
add_music(mountain_6, mu_mountain2, mu_mountainsecret, 1)
add_music(dance_1, mu_dance2, mu_dancesecret, 0)
add_music(dance_8, mu_dance2, mu_dancesecret, 1)
add_music(dance_9, mu_dance, mu_dancesecret, 1)
add_music(sucrose_1, mu_sucrose, mu_sucrose, 0)
add_music(estate_1, mu_estate, mu_estatesecret, 0)
add_music(bee_1, mu_martian, mu_what, 0)

/*
music_arr = [
// Hub
{ rm : rm_introVideo, song : noone, secret_song : mu_painter, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : rm_luigisawesometestingroom, song : mu_martian_freezer, secret_song : mu_painter, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : devroom, song : mu_what, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : testroom, song : mu_steamy, secret_song : mu_steamy, continuous : true, loop_begin : 0, loop_end : undefined },
{ rm : rm_missing, song : mu_void, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : realtitlescreen, song : mu_title, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : hub_w1, song : mu_hubw1, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : outer_room1, song : mu_hubw1, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : hub_w2, song : mu_hubw2, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : hub_shop1, song : mu_hubshop1, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : hub_shop2, song : mu_hubshop2, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : rm_credits, song : mu_credits, secret_song : mu_steamy, continuous : false, loop_begin : 0, loop_end : undefined },
// Levels
// W1
{ rm : tutorial_1, song : mu_tutorial, secret_song : mu_wafflesecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : tutorial_10, song : mu_tutorial, secret_song : mu_wafflesecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : entryway_1, song : mu_waffle, secret_song : mu_wafflesecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : steamy_1, song : mu_steamy, secret_song : mu_steamysecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : steamy_7, song : mu_steamy, secret_song : mu_steamysecret, continuous : true, loop_begin : 0, loop_end : undefined },
{ rm : steamy_8, song : mu_steamyinner, secret_song : mu_steamysecret, continuous : true, loop_begin : 0, loop_end : undefined },
{ rm : molasses_1, song : mu_swamp1, secret_song : mu_swampsecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : molasses_6, song : mu_swamp1, secret_song : mu_swampsecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : molasses_6b, song : mu_swamp2, secret_song : mu_swampsecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : mines_1, song : mu_mineshaft1, secret_song : mu_minessecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : mines_6, song : mu_mineshaft2, secret_song : mu_minessecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : dragonlair_1, song : mu_gummyharry, secret_song : mu_gummyharry, continuous : false, loop_begin : 0, loop_end : undefined },
// W2
{ rm : mountain_intro, song : mu_mountain1, secret_song : mu_mountainsecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : mountain_5, song : mu_mountain1, secret_song : mu_mountainsecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : mountain_6, song : mu_mountain2, secret_song : mu_mountainsecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : dance_1, song : mu_dance, secret_song : mu_dancesecret, continuous : false, loop_begin : 0, loop_end : undefined },
/*
{ rm : dance_1, song : mu_dance, secret_song : mu_wafflesecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : dance_7, song : mu_dance, secret_song : mu_wafflesecret, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : dance_8, song : mu_dance3, secret_song : mu_wafflesecret, continuous : false, loop_begin : 0, loop_end : undefined },

{ rm : martian_1, song : mu_martian_freezer, secret_song : mu_martian, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : martian_7, song : mu_martian, secret_song : mu_martian, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : sucrose_1, song : mu_sucrose, secret_song : mu_sucrose, continuous : false, loop_begin : 9.45, loop_end : undefined },

//Boss
//{ rm : rm_painter, song : mu_gummyharry, secret_song : mu_gummyharry, continuous : false, loop_begin : 0, loop_end : undefined },
{ rm : rm_painterarena, song : noone, secret_song : mu_painter, continuous : false, loop_begin : 0, loop_end : undefined },



//[tutorial_1, mu_tutorial, mu_waffle, 0, 0, undefined],
//[entryway_1, mu_waffle, mu_wafflesecret, 0, 0, undefined],
//[steamy_1, mu_steamy, mu_steamysecret, 0, 0, undefined],
//[steamy_7, mu_steamy, mu_steamysecret, 1, 0, undefined],
//[steamy_8, mu_steamyinner, mu_steamysecret, 1, 0, undefined],
//[molasses_1, mu_swamp1, mu_swampsecret, 0, 0, undefined],
//[mines_1, mu_mineshaft1, mu_minessecret, 0, 0, undefined],
//[mines_6, mu_mineshaft2, mu_minessecret, 0, 0, undefined],
//[mountain_1, mu_mountain1, mu_mountainsecret, 0, 0, undefined],
//[mountain_4, mu_mountain1, mu_mountainsecret, 0, 1, undefined],
//[mountain_lol, noone, mu_mountainsecret, 0, 1, undefined],
//[mountain_6, mu_mountain1, mu_mountainsecret, 0, 1, undefined],
//[dance_1, mu_dance, mu_dance, 0, 0, undefined],
//[martian_1, mu_martian, mu_martian, 0, 0, undefined],
]
//Sucrose Shit (takenb from d3 beach stuff tee hee)
playintro = true;
nolag = 0;
settoshift = false
//effect

fuzz = 0
minfuzz = 1 //goto 0.95
maxfuzz = 1 //goto 1.05