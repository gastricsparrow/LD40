extends Area2D

var in_zone = []
var player = null

func _ready():
	player = get_node("Player")
	var col = get_node("CollisionShape2D")
	col.set_pos(Vector2(0,global_var.win_con[str(global_var.level)]))
	var spr = get_node("Line")
	spr.set_pos(Vector2(0,global_var.win_con[str(global_var.level)]))
	connect("body_enter_shape", self, "_on_body_enter")
	connect("body_exit_shape", self, "_on_body_exit")

func _on_body_enter(id, body, body_shape, area_shape):
	if body extends RigidBody2D:
		if in_zone.has(id):
			pass
		else:
			in_zone.append(id)
			print(id, " joins ", in_zone)
			var timer = Timer.new()
			timer.set_wait_time(3)
			timer.set_one_shot(true)
			timer.connect("timeout",self,"_on_timeout")
			timer.start()
			add_child(timer)

func _on_body_exit(id, body, body_shape, area_shape):
	if body extends RigidBody2D:
		if in_zone.has(id):
			in_zone.erase(id)
		print(id, " leaves ", in_zone)

func _on_timeout():
	if in_zone.size() > 0:
		player.play("youwin")
		player.connect("finished",self,"_win")
	else:
		#retry
		pass
		
func _win():
	global_var.level += 1
	get_tree().reload_current_scene()