/// @description Input and Output.
var _values; _values[0] = false;
var i = 0;
// Input
with (par_logicobjects) {
	if outputID == other.inputID {	
		_values[i++] = logicOutput;
	}
}
// Process.
var _check = false;
for (var i = 0; i < array_length(_values); ++i) {
    if _values[i] {
		_check = true;
		break;
	}
}
logicOutput = _check;

// Output.
with (par_logicobjects) {
	if inputID == other.outputID {
		logicOutput = _check;
		break;
	}
}
