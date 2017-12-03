
extends Position2D

var mousepoint = Vector2(0,0)
var mouse_distance
var cursor = Vector2()

func _ready():
	cursor = get_global_pos()
	set_fixed_process(true)

func _fixed_process(delta):
	mousepoint = get_local_mouse_pos()
	update()
	
func _draw():
	if get_children().size() > 0:
		draw_line(cursor, mousepoint, Color(1,1,1,0.4), 1)