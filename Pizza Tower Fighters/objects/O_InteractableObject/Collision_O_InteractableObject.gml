var _tb = instance_create_layer(0, 0, "Instances", O_TextBoxs);
var _list = _tb.messages;

for (var i = 0; i < array_length(msg); i++)
{
    var _arr = msg[i];
    ds_list_add(_list, _arr);
}
