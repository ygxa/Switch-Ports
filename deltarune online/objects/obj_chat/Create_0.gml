/// @description Initialize Chat System

//Create a list to hold the chat messages
globalvar CHAT;
CHAT = ds_list_create();
stored_messages = 6;


//Create variables for text input
focus = false;
cursor = "|";
text = "";
max_text = 200;			//Max amount of characters
alarm[0] = room_speed;	//Time for cursor blink
