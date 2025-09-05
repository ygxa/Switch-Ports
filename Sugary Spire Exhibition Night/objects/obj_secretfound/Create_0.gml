if instance_exists(obj_randomsecret){
	instance_destroy()
	exit;
}
collectSecretList = ds_list_create()
depth = 10
