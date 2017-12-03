extends Position2D

var queue = []
var offset = 160
var order = 0
onready var button_ref = preload("res://Scenes/button.tscn")


func _ready():
	order = 0
	queue = global_var.levels[str(global_var.level)]
	if queue.size() > 0:
		for animal in queue:
			order += 1
			var button = button_ref.instance()
			button.set("animal_name", animal)
			button.set_pos(Vector2(-offset*order,0))
			add_child(button)

func _fixed_process(delta):
	pass