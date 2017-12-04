extends Area2D

var in_zone = []
var name = []
var name_no = 0
var player = null
var winning = 0
var timer_no = 0

func _ready():
	winning = 0
	timer_no = 0
	in_zone = []
	player = get_node("Player")
	var col = get_node("CollisionShape2D")
	col.set_pos(Vector2(0,global_var.win_con[str(global_var.level)]))
	var spr = get_node("Line")
	spr.set_pos(Vector2(0,global_var.win_con[str(global_var.level)]))
	connect("body_enter_shape", self, "_on_body_enter")
	connect("body_exit_shape", self, "_on_body_exit")

func _on_body_enter(id, body, body_shape, area_shape):
	if body != null:
		if body extends RigidBody2D:
			if in_zone.has(str(id)):
				pass # Skip duplicates
			else:
				in_zone.append(str(id))
				name.append(str(id))
				print(id, " joins ", in_zone)
				var timer = Timer.new()
				timer.set_wait_time(3)
				timer.set_one_shot(true)
				timer.connect("timeout",self,"_on_timeout")
				timer.start()
				add_child(timer)

func _on_body_exit(id, body, body_shape, area_shape):
	if body != null:
		if body extends RigidBody2D:
			if in_zone.has(str(id)):
				in_zone.erase(str(id))
				print(id, " leaves ", in_zone)

func _on_timeout():
	print("tick")
	if in_zone.has(str(name[timer_no])) && winning == 0:
		winning = 1
		player.play("youwin")
		player.connect("finished",self,"_win")
	else:
		#retry
		pass
	
	timer_no += 1

func _win():
	if global_var.level < 5:
		global_var.level += 1
	get_tree().reload_current_scene()