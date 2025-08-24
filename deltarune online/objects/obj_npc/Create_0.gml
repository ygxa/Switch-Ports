event_inherited()
depth = obj_player.depth + 1
state = "normal"
text1 = ""
text2 = ""
text3 = ""
text4 = ""
text5 = ""
textbox = spr_textbox
image_speed = 0.25
textspeed = 0.5
chatpart = 0
text = text1
textletter = 0
function wrap_txt(_s, _n){
    var output = ""
    var line   = ""
    var word   = ""
    var i      = 1
    var length = string_length(_s)
    
    while (i <= length){
        var ch = string_char_at(_s, i)
        
        if ch == " " or ch == "\n"{
            if (string_length(line + word) > _n){
                output += line + "\n"
                line = ""
            }
            line += word
            if (ch == " ") line += " "
            word = ""
            
            if (ch == "\n"){
                output += line + "\n"
                line = ""
            }
        }
        else
            word += ch
        
        i++
    }
    
    if (string_length(line + word) > _n){
        output += line + "\n"
        line = ""
    }
    
    return output + line + word
}
