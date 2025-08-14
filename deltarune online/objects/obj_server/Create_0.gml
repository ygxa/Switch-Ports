/// @description Initialize Server

//Server Variables
port = 7676;
max_players = 8;

server = network_create_server(network_socket_tcp, port, max_players);
total_players = ds_list_create();

//create a map to keep track of clients
server_instances = ds_map_create();

//Display error if server is unable to be created
if (server < 0) {
	show_message("Error creating server.");
	game_restart();
}
