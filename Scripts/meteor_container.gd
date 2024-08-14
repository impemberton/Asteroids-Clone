extends Node2D

@export var meteor: PackedScene

func create_meteor(pos: Vector2, health: int, repeat: bool):
	var new_meteor = meteor.instantiate()
	add_child(new_meteor)
	new_meteor.health = health
	new_meteor.scale = 2 * Vector2(health, health)
	new_meteor.direction = Vector2(randf_range(-1,1), randf_range(-1,1))
	new_meteor.global_position = pos
	new_meteor.connect("split", create_meteor)
	
	if repeat:
		create_meteor(pos, health, false)
