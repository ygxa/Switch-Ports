/// @description Recieve Incoming Data

/*
This is the same scenario as the server, more or less. Here we simply do the same as the server, and get the incoming buffer packet
Then, we can read this data and assign it to whoever we need to

See more below
*/

var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {

	#region Latency
	case network.latency:
		//Read the time that was sent to us in the packet
		var _got_time = buffer_read(packet, buffer_u32);
		
		//Set our latency to be the difference
		latency = current_time - _got_time;
		
		//Reset the timeout because we are still connected
		timeout = 0;
	break;
	#endregion
	
	#region Join
	case network.join:
		//read the ID of the player connecting
		var connect_id = buffer_read(packet, buffer_u16);
		
		//write to our chat that they joined the game
		ds_list_add(CHAT, string(connect_id) + " has joined the game.");
	break;
	#endregion

	#region Movement
	case network.move:	//If we get the packet for movement, assign it to the correct player
		var player_id = buffer_read(packet, buffer_u16);
		var find_player = ds_map_find_value(instances, player_id);		//Find the instance ID of the player through the instance map
		
		//If there is no player with that ID in our map, then create one and add it to the map
		if (is_undefined(find_player)) {
			var p = instance_create_layer(134, 200, layer, obj_player);
			ds_map_add(instances, player_id, p);
		} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			if (player_id != idd) && instance_exists(find_player) {
				//Read the rest of the data from the packet
				var player_x = buffer_read(packet, buffer_s16);
				var player_y = buffer_read(packet, buffer_s16);
				var player_sprite = buffer_read(packet, buffer_s16);
				var player_imageindex = buffer_read(packet, buffer_s16);
				
				//Assign this data to the correct player
				find_player.x =	player_x;
				find_player.y =	player_y;
				find_player.sprite_index = player_sprite;
				find_player.image_index = player_imageindex;
			}
		}
	break;
	#endregion
	
	#region Chat
	case network.chat:
		//Read the message from the packet
		var msg = buffer_read(packet, buffer_string);
		
		//Now we need to add that string to the chat list
		if (instance_exists(obj_chat)) {
			ds_list_add(CHAT, msg);	
		}
	break;
	#endregion
	
	#region Disconnect
	case network.disconnect:
		//read the ID of the player to disconnect
		var disconnect_id = buffer_read(packet, buffer_u16);
		
		//find the instance that corresponds to that ID
		var disconnect_player = ds_map_find_value(instances, disconnect_id);
		
		//if that player exists, find and destroy them for all clients
		if (disconnect_id != idd) {
			if (!is_undefined(disconnect_player)) {
				//destroy the player disconnecting
				with (disconnect_player) { instance_destroy(); }	
				
				//display in chat that they left the game
				ds_list_add(CHAT, string(disconnect_id) + " has left the game.");
			}
		} else {
			game_restart()
		}
	break;
	#endregion

}
