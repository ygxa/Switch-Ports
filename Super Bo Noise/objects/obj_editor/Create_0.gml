depth = -100
object_list[0] = ds_list_create()
object_list[1] = ds_list_create()
object_list[2] = ds_list_create()
info = ""
object = -4
state = 0
commandlist = ds_list_create()
undo = 1
selectedobjects = ds_list_create()
layerdepth = 0
rooms = ds_list_create()
selectedroom = 0
ds_list_add(rooms, new EditorRoom())
scr_editor_camera_init()
scr_editor_init_objects()
scr_editor_init_buttons()
