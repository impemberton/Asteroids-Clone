extends Area2D

signal split(pos, health, repeat)

var direction: Vector2 = Vector2.UP
@export var speed: float = 50.0
var health: int = 4


func _physics_process(delta: float) -> void:
	global_position = Vector2(wrapf(global_position.x, -10, 1162),wrapf(global_position.y, -10, 658))
	position += direction * speed * delta

func take_damage():
	health -= 1
	if health > 0:
		split.emit(global_position, health, true)
	queue_free()	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage()
		queue_free()
