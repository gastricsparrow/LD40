extends Label

var text = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	text = global_var.text_guide[str(global_var.level)]
	set_text(text)