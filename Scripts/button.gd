extends TextureButton

var animal_name = ""
var sprite = null
var scale = Vector2()
var animal = null
var pet_cursor = null
var current_pet = null
var was_pressed = 0
var is_selected = false

func _ready():
	if animal_name != "":
		sprite = load("res://Sprites/"+animal_name+".png")
	else:
		print("Failed to load animal")
		pass
	scale = get_scale()
	set_normal_texture(sprite)
	set_process_input(true)
	set_fixed_process(true)
	
func _input(event):
	if is_hovered() && !is_selected:
		set_scale(scale*1.2)
	else:
		set_scale(scale)

func _fixed_process(delta):
	# IS ACTION RELEASED
	if !is_pressed() && was_pressed == 1 && !is_selected:
		is_selected = true
		set_modulate(Color(0.2,0.2,0.2))
		print("Pet incoming!")
		pet_cursor = get_node("../../Center/PetCursor")
		
		if animal_name != "":
			animal = load("res://Scenes/"+animal_name+".tscn").instance()
			pet_cursor.add_child(animal)
		
	if is_pressed():
		was_pressed = 1
	else:
		was_pressed = 0