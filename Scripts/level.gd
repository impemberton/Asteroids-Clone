extends Node2D

@onready var ui: Control = $UILayer/UI
@onready var player: CharacterBody2D = $Player

@onready var score: int:
	set(new_score):
		ui.update_score(new_score)
		score = new_score
	get:
		return score	

var lives: int:
	set(new_lives):
		ui.update_lives(new_lives)
		lives = new_lives
		if lives <= 0:
			player.queue_free()
			ui.game_over()
	get:
		return lives
		
func _ready() -> void:
	score = 0
	lives = 3

func _on_player_death() -> void:
	lives -= 1
