# shoot the animal ( not like that ! )

extends TextureButton

onready var holder = get_node("../PetCursor")
onready var target = get_node("../Shooter")


func _ready():
	set_process_input(true)
	
func _input(event):
	# released
	if is_pressed():
		for child in holder.get_children():
			print(child.get_name())
			if child.get_gravity_scale() == 0:
				child.set_gravity_scale(5)
	