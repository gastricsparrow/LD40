extends Position2D

var queue = []
var offset = 160
var order = 0
onready var button_ref = preload("res://Scenes/button.tscn")
var y_offset = 0

func _ready():
	order = 0
	queue = global_var.queue[str(global_var.level)]
	
	if queue.size() > 0:
		for animal in queue:
		
			var button = button_ref.instance()
			button.set("animal_name", animal)
			button.set_pos(Vector2(-offset*(order%4),y_offset))
			add_child(button)
			order += 1
			if order == 4:
				y_offset -= 160
				
	else: # random level
		var animals = ["mouse", "cat", "parrot", "dog", "chicken", "fox", "wolf", "frog", "snake", "lion"]
		animals.remove(floor(rand_range(0,animals.size())))
		animals.remove(floor(rand_range(0,animals.size())))
		
		for animal in animals:
			if animal == "snake":
				order += 1
			var button = button_ref.instance()
			button.set("animal_name", animal)
			button.set_pos(Vector2(-offset*(order%4),y_offset))
			add_child(button)
			order += 1
			if order == 4:
				y_offset -= 160

func _fixed_process(delta):
	pass