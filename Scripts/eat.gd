# eat: decide which animal eats which animal
extends RigidBody2D

# class member variables go here, for example:
var name = ""
var value = 0


func _ready():
	for c in get_children():
		if c extends Sprite:
        	name = c.get_name()
	if name != "":
		value = global_var.food_chain[name]
	set_fixed_process(true)
	
func _fixed_process(delta):
	if get_colliding_bodies().size() > 0:
		var body = get_colliding_bodies()[0]
		if value % body.get("value") == 1:
			body.queue_free()
		elif body.get("value") % value == 1:
			queue_free()