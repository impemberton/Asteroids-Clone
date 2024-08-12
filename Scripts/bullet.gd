extends Area2D

@export var speed = 450
var direction

func _ready() -> void:
	set_as_top_level(true)

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage()
		queue_free()

#func _on_area_entered(area: Area2D) -> void:
	#if area.is_in_group("enemy_bullet"):
		#area.queue_free()
		#queue_free()
