extends Node

func _ready():
	
	set_process_input(true)

func _input(event):
	if event.is_action_released("ui_select"):
		Transition.fade_to("res://Scenes/GameScene.tscn")