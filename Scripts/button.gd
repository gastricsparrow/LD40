extends TextureButton

var animal_name = ""
var sprite = null
var scale = Vector2()
var animal = null
var pet_cursor = null
var current_pet = null

func _ready():
	if animal_name != "":
		sprite = load("res://Sprites/"+animal_name+".png")
	else:
		print("Failed to load animal")
		pass
	scale = get_scale()
	set_normal_texture(sprite)
	set_process_input(true)
	
func _input(event):
	if is_hovered():
		set_scale(scale*1.2)
	else:
		set_scale(scale)
	if is_pressed():
		print("Lion coming!")
		pet_cursor = get_node("../../Center/PetCursor")
		for child in pet_cursor.get_children():
			child.queue_free()
		if animal_name != null:
			animal = load("res://Scenes/"+animal_name+".tscn").instance()
			animal.set_gravity_scale(0)
			animal.set_name("Current")
			pet_cursor.add_child(animal)
		