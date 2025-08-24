/// @description eas_enum_to_string(enumval)
/// @param enumval
function eas_enum_to_string(argument0) {

	//Turns an enum value into a string, since you can't do that "natively" in GML.

	switch (argument0)
	{
	    case EASYASYNC_STATE.IDLE:
	        return "IDLE";
	    case EASYASYNC_STATE.SAVING:
	        return "SAVING";
	    case EASYASYNC_STATE.LOADING:
	        return "LOADING";
	    default:
	        return "UNKNOWN";
	}



}
