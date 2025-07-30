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
var _initial = _values[0] ? -1 : 1;
if array_length(_values) > 1 {
	for (var i = 1; i < array_length(_values); ++i) {
		_initial *= (_values[i] ? -1 : 1);
	}
}
logicOutput = (_initial == -1 ? true : false);

// Output.
with (par_logicobjects) {
	if inputID == other.outputID {
		logicOutput = other.logicOutput;
		break;
	}
}
