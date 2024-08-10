extends CharacterBody2D


@export var speed = 400.0
@export var rotation_speed = 1.5

func _physics_process(delta: float) -> void:

	var rotation_direction := Input.get_axis("turn_left", "turn_right")
	rotation += rotation_direction * rotation_speed * delta
	
	if Input.is_action_pressed("move_forward"):
		velocity = transform.x * speed
	else:
		velocity.lerp(Vector2.ZERO, 500)
		
	move_and_slide()
