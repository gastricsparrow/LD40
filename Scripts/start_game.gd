extends Node

var song
var player

func _ready():
	
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON || event.type == InputEvent.KEY:
		Transition.fade_to("res://Scenes/Level.tscn")