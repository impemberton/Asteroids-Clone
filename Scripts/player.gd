extends CharacterBody2D

@export var acceleration = 0.025
@export var max_speed = 600.0
@export var rotation_speed = 2.0
@onready var sprite_2d: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	sprite_2d.frame = abs(int((rotation_degrees + 360) / 45)) - 4
	
	var rotation_direction := Input.get_axis("turn_left", "turn_right")
	rotation += rotation_direction * rotation_speed * delta
	
	if Input.is_action_pressed("move_forward"):
			velocity = velocity.lerp(transform.x * max_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, acceleration)
		
	move_and_slide()

func animate_lighting():
	pass
