extends Area2D

signal split(pos, health, repeat)

var direction: Vector2 = Vector2.UP
@export var speed: float = 50.0
var health: int = 4


func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func take_damage():
	health -= 1
	if health > 0:
		split.emit(global_position, health, true)
	queue_free()	


