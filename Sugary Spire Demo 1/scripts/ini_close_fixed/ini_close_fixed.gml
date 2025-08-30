// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ini_close_fixed(){
	ini_close()
	
	if os_type = os_switch
		switch_save_data_commit();	
}