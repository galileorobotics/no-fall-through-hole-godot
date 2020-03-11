extends RigidBody2D

export var speed = 20
var screen_size
var velocity = Vector2()  # The player's movement vector.

func _ready():
     screen_size = get_viewport_rect().size

func _integrate_forces(state):
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
    set_applied_force(velocity)
