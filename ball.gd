extends KinematicBody2D

export var speed = 200
var screen_size
var velocity = Vector2()  # The player's movement vector.
# Called when the node enters the scene tree for the first time.
func _ready():
     screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
   
    if Input.is_action_pressed("ui_right"):
        velocity.x += 10
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 10
    if Input.is_action_pressed("ui_down"):
        velocity.y += 10
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 10
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
    var collision_info = move_and_collide(velocity * delta)
    if collision_info:
        velocity = velocity.bounce(collision_info.normal)
