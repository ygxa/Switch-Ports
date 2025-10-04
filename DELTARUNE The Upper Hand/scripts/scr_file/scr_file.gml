function save_string(arg0, arg1)
{
    var _buffer = buffer_create(string_byte_length(arg0) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, arg0);
    buffer_save(_buffer, arg1);
    buffer_delete(_buffer);
}

function load_string(arg0)
{
    var _buffer = buffer_load(arg0);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return _string;
}

function file_save()
{
    var fileName = "save1";
    
    if (file_exists(fileName))
        file_delete(fileName);
    
    var _rootStruct = 
    {
        _save: op.save,
        _keys: op.keys,
        _itemsON: op.itemsON,
        _musicStyle: op.musicStyle,
        _challengeMode: op.challengeMode,
        _versionNumber: op.versionNumber
    };
    var json = json_stringify(_rootStruct);
    save_string(json, fileName);
}

function file_load()
{
    var fileName = "save1";
    
    if (!file_exists(fileName))
        exit;
    
    var _json = load_string(fileName);
    var _rootStruct = json_parse(_json);
    
    if (_rootStruct._versionNumber == "1.0")
    {
        op.save = _rootStruct._save;
        op.keys = _rootStruct._keys;
        op.itemsON = _rootStruct._itemsON;
        op.musicStyle = _rootStruct._musicStyle;
        op.challengeMode = _rootStruct._challengeMode;
    }
}
