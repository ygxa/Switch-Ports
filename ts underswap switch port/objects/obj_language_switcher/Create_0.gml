fade = 0;
alarm[0] = 1;
title = dxd_raw("language_switcher.lselect");
loading = dxd_raw("language_switcher.lloading");
selected = global.lang_bound;
languageCount = array_length(global.lang_data);
languages = array_create(languageCount);

for (var i = 0; i < languageCount; i++)
{
    var curr = global.lang_data[i];
    var name = variable_struct_get(curr, "ascii_name") ?? "[unknown]";
    var langCode = variable_struct_get(curr, "language_code") ?? "";
    
    if (langCode != "")
    {
        name += (" (" + string_upper(langCode));
        var regionCode = variable_struct_get(curr, "region_code") ?? "";
        
        if (regionCode != "")
            name += ("-" + string_upper(regionCode) + ")");
        else
            name += ")";
    }
    
    languages[i] = name;
}

startY = 234 - (languageCount * 16);

if (startY < 74)
    startY = 74;

callback = undefined;
foundLanguageSelectStrings = false;

getLocString = function(argument0)
{
    foundLanguageSelectStrings = false;
    var data = variable_struct_get(array_get(global.lang_data, global.lang_bound), "language_select");
    
    if (is_undefined(data))
        data = global.lang_data[0].language_select;
    else
        foundLanguageSelectStrings = true;
    
    var subData = variable_struct_get(data, argument0);
    subData ??= variable_struct_get(global.lang_data[0].language_select, argument0);
    return subData;
};

arrowTimer = 0;
