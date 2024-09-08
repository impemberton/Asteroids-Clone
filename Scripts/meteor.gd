extends Area2D

signal split(pos, health, repeat)
signal add_score(score)

var rotation_speed = randf_range(-3,3)
var direction: Vector2 = Vector2.UP
@export var speed: float = randf_range(50, 300)
var health: int = 4
@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	sprite_2d.frame = wrapi((abs(int((rotation_degrees + 202.5) / 45))-4), 0, 8)
	global_position = Vector2(wrapf(global_position.x, -10, 1162),wrapf(global_position.y, -10, 658))
	position += direction * speed * delta
	rotation_degrees = wrapf(rotation_degrees + rotation_speed, -180, 180) 
	
	
func take_damage():
	health -= 1
	add_score.emit(50)
	if health > 0:
		split.emit(global_position, health, true, 50)
	queue_free()	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
		queue_free()
