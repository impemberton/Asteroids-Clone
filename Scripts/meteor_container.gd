extends Node2D

@export var meteor: PackedScene
@onready var meteor_container: Node2D = $MeteorContainer
@onready var meteor_spawner: PathFollow2D = $MeteorSpawnLine/MeteorSpawner

func create_meteor(pos: Vector2, health: int, repeat: bool):
	var new_meteor = meteor.instantiate()
	meteor_container.call_deferred("add_child", new_meteor)
	new_meteor.health = health
	new_meteor.scale = Vector2(health, health)
	new_meteor.direction = Vector2(randf_range(-1,1), randf_range(-1,1))
	new_meteor.global_position = pos
	new_meteor.connect("split", create_meteor)
	
	if repeat:
		create_meteor(pos, health, false)

func _on_spawn_timer_timeout() -> void:
	meteor_spawner.progress_ratio = randf_range(0, 1)
	create_meteor(meteor_spawner.global_position, 4, false)
