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
logicOutput = _values[irandom_range(0, array_length(_values) - 1)];


// Output.
with (par_logicobjects) {
	if inputID == other.outputID {
		logicOutput = other.logicOutput;
		break;
	}
}



