# from https://godotengine.org/qa/6615/dragging-object-in-godot-rigidbody2d-dragging

extends RigidBody2D

const RIGIDBODY_SPEED = 2000 # set a smaller value for slower rigidbody movement

var is_dragging = false
var mouse_is_over = false
var keydown_mouseleft = false
var mousepoint = Vector2(0,0)
var mouse_distance
var rigidbody_vector = 0


func _ready():
    set_process_input(true)
    set_fixed_process(true)


func _input(event):
    if event.is_action_pressed("mouse_down"): keydown_mouseleft = true

    if event.is_action_released("mouse_down"):
        keydown_mouseleft = false
        is_dragging = false


func _fixed_process(delta):
    if keydown_mouseleft and mouse_is_over:
        mousepoint = self.get_global_mouse_pos()
        mouse_distance = self.get_pos().distance_to(mousepoint)
        is_dragging = true

        if (mouse_distance <= 5.0):
            rigidbody_vector = 0
            self.set_linear_velocity(Vector2())
        else:
            rigidbody_vector = (mousepoint - self.get_pos()).normalized()
            self.set_linear_velocity(rigidbody_vector * RIGIDBODY_SPEED * mouse_distance * delta)

    if not keydown_mouseleft or not mouse_is_over:
        is_dragging = false
        self.set_linear_velocity(Vector2())


func _on_RigidBody2D_mouse_enter():
    mouse_is_over = true


func _on_RigidBody2D_mouse_exit():
    if not is_dragging: mouse_is_over = false