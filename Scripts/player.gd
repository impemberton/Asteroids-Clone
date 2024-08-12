extends CharacterBody2D

@export var acceleration = 0.025
@export var max_speed = 600.0
@export var rotation_speed = 2.0
@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var bullet_spawn_point: Marker2D = $BulletSpawnPoint
@export var bullet: PackedScene


func _physics_process(delta: float) -> void:
	#changing the frame to give a lighting effect
	sprite_2d.frame = wrapi((abs(int((rotation_degrees + 360) / 45)) - 6), 0, 8)
	
	var rotation_direction := Input.get_axis("turn_left", "turn_right")
	rotation += rotation_direction * rotation_speed * delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	if Input.is_action_pressed("move_forward"):
			velocity = velocity.lerp(transform.x * max_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, acceleration)
		
	move_and_slide()

func shoot():
	var new_bullet = bullet.instantiate()
	new_bullet.global_position = bullet_spawn_point.global_position
	new_bullet.rotation = rotation + PI/2
	new_bullet.direction = transform.x
	add_child(new_bullet)
	
