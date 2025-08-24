// Handle packets coming from clients

function server_data() {

	var packet = async_load[? "buffer"];		//Load the ID of the buffer that was sent to us
	var socket = async_load[? "id"];			//Get the socket of the client who sent this packet
	buffer_seek(packet, buffer_seek_start, 0);  //Make sure we are at start of the incoming packet
	
	var PACKET_ID = buffer_read(packet, buffer_u8); //Read the first value of the packet, which is the network enum
	
	switch (PACKET_ID) {
		
		#region Latency
		case network.latency:
			//Get the contents of the packet
			var _time = buffer_read(packet, buffer_u32);
			
			//Send this back to the client that sent it
			var lbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(lbuff, buffer_seek_start, 0);
			buffer_write(lbuff, buffer_u8, network.latency);
			buffer_write(lbuff, buffer_u32, _time);
			
			network_send_packet(socket, lbuff, buffer_tell(lbuff));
			buffer_delete(lbuff);
		break;
		#endregion
		
		#region Join
		case network.join:
			//read the contents of the packet
			var client_idd = buffer_read(packet, buffer_u16);
			var player_idd = buffer_read(packet, buffer_u16);
			
			//add these to the server's instance map
			ds_map_add(server_instances, client_idd, player_idd);
			
			//send these back to all connected clients
			var jbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(jbuff, buffer_seek_start, 0);
			buffer_write(jbuff, buffer_u8, network.join);	//remeber to send the id first
			buffer_write(jbuff, buffer_u16, client_idd);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), jbuff, buffer_tell(jbuff));	
			}
			
			//Delete the join buffer after it was sent
			buffer_delete(jbuff);
		break;
		#endregion
		
		#region Movement
		case network.move:			//If we recieve the move enum, this event will occur
			var player_id =	buffer_read(packet, buffer_u16);	//Read the contents of the buffer IN THE ORDER IT WAS SENT
			var player_x = buffer_read(packet, buffer_s16);
			var player_y = buffer_read(packet, buffer_s16);
			var player_sprite = buffer_read(packet, buffer_s16);
			var player_imageindex = buffer_read(packet, buffer_s16);
			
			//Now take all those variables, and send them to all of the other clients
			//Send them in the same order they were read above
			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.move);
			buffer_write(buff, buffer_u16, player_id);
			buffer_write(buff, buffer_s16, player_x);
			buffer_write(buff, buffer_s16, player_y);
			buffer_write(buff, buffer_s16, player_sprite);
			buffer_write(buff, buffer_s16, player_imageindex);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));	
			}
			
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		#endregion
		
		#region Shooting
		case network.shoot:
		break;
		#endregion
		
		#region Chat
		case network.chat:
			//Get the string from the buffer
			var text_message = buffer_read(packet, buffer_string);
			
			//Send that string back to all of the other clients
			var tbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(tbuff, buffer_seek_start, 0);
			buffer_write(tbuff, buffer_u8, network.chat);	//send our chat ID so clients know what the packet is
			buffer_write(tbuff, buffer_string, text_message); //send the message string
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), tbuff, buffer_tell(tbuff));	
			}
			
			//Delete the chat buffer after it was sent
			buffer_delete(tbuff);
		break;
		#endregion
		
		#region Disconnect
		case network.disconnect:
			//read the value
			var discon_id = buffer_read(packet, buffer_u16);
			
			//write to new buffer
			var dbuff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dbuff, buffer_seek_start, 0);
			buffer_write(dbuff, buffer_u8, network.disconnect);
			buffer_write(dbuff, buffer_u16, discon_id);
			
			//Loop through the total player list (containing sockets) and send the packet to each one
			for (var i = 0; i < ds_list_size(total_players); i++) {
				network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));	
			}
			
			//remove them from the list
			ds_list_delete(total_players, ds_list_find_index(total_players, socket));
		break;
		#endregion
		
	}

}
