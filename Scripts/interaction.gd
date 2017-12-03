# attached to PetCursor
extends Position2D

var mousepoint = Vector2(0,0)
var mouse_distance
onready var shooter = get_node("../Shooter")
var mouse_in_area = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	mousepoint = get_local_mouse_pos()
	update()

func _draw():
	if get_children().size() > 0:
		draw_line(Vector2(0,0), mousepoint, Color(1,1,1,0.4), 1)