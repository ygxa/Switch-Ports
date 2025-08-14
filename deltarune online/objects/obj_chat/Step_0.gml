/// @description Text Input and Sending Data

//Check if the user has opened the chat
if (keyboard_check_released(vk_tab)) {
	focus = !focus;		//set our focus to be opposite
	text = "";			//set the text to nothing
	keyboard_string = ""; //set the keyboard string to nothing 
}


//If the text box is open
if (focus) {
	text = keyboard_string;		//set our text variable to be whatever the user types
	
	//If the user presses enter to send the chat:
	if (keyboard_check_released(vk_enter) && string_length(text) < max_text) {
		
		//Create a buffer (packet) to send to the server	
		var text_buff = buffer_create(32, buffer_grow, 1);
		buffer_seek(text_buff, buffer_seek_start, 0);
		buffer_write(text_buff, buffer_u8, network.chat);
		buffer_write(text_buff, buffer_string, "[" + string(obj_client.idd) + "]: " + string(text));
		
		//Send the data to the server using the client socket
		network_send_packet(obj_client.client, text_buff, buffer_tell(text_buff));
		
		//Delete the buffer
		buffer_delete(text_buff);
		
		//Reset the text back to nothing, and exit the chat
		text = "";
		keyboard_string = "";
		focus = !focus;
		
	}
}

//Control how many messages are stored in the chat at once
while (ds_list_size(CHAT) > stored_messages) {
	ds_list_delete(CHAT, 0);	//Delete the message that was sent the longest ago
}
