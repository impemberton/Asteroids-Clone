extends Area2D

signal split(pos, health, repeat)
var rotation_speed = randf_range(-2,2)
var direction: Vector2 = Vector2.UP
@export var speed: float = 50.0
var health: int = 4
@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	sprite_2d.frame = wrapi((abs(int((rotation_degrees + 202.5) / 45))-4), 0, 8)

	global_position = Vector2(wrapf(global_position.x, -10, 1162),wrapf(global_position.y, -10, 658))
	position += direction * speed * delta
	rotation_degrees += rotation_speed
func take_damage():
	health -= 1
	if health > 0:
		split.emit(global_position, health, true)
	queue_free()	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
		queue_free()
