playerx = 100+obj_camera.camera_x
playery = 100+obj_camera.camera_y
instance_create(x,y,obj_battleback)
baddiex = 288+obj_camera.camera_x
baddiey = 104+obj_camera.camera_y
drawx = 0
drawy = 0
turn = "intro"
selection = 0

alarm[1] = -1
alarm[0] = -1
baddieid = id
baddiemove = "null"
projectile = obj_soul
savedplayerx = obj_player.x
savedplayery = obj_player.y
global.battle = true