# eat: decide which animal eats which animal
extends RigidBody2D

# class member variables go here, for example:
var name = ""
var value = 0
var colliders = []
var timer = null

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
						var win_con = get_tree().get_root().get_node("Top/Center/WinCon")
						var player = win_con.get_node("Player")
#						var label = win_con.get_node("WinPlate")
#						label.set_texture(load("res://Sprites/failed.png"))
#						label.get_node("ColorFrame").set_frame_color(Color(0.6,0,0))
						player.play("eaten")
						player.connect("finished",self,"_lost")
						get_tree().get_root().get_node("Top/Sample").play("Gulp")
						body.queue_free()

func _lost():
	get_tree().reload_current_scene()