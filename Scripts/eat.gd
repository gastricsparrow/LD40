# eat: decide which animal eats which animal
extends RigidBody2D

# class member variables go here, for example:
var name = ""
var value = 0
var colliders = []

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(1)
	for c in get_children():
		if c extends Sprite:
			name = c.get_name()
			print (name)
		
	if name != "":
		value = global_var.food_chain[name]
		print(value)
	set_fixed_process(true)
	
func _fixed_process(delta):
	colliders = get_colliding_bodies()
	if colliders.size() > 0:
		for body in get_colliding_bodies():
			if body.get_name() != "StaticBody2D":
				var col_value = body.get("value")
				if col_value != null:
					if value % col_value == 1:
#						set_pos(col.get_global_pos()) PLAY DEATH ANIM
						body.queue_free()