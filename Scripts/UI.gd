extends Control

@onready var score_label: Label = $"Score Label"
@onready var lives_label: Label = $"Lives Label"
@onready var game_over_menu: Control = $GameOverMenu
@onready var game_over_score_label: Label = $GameOverMenu/Menu/GameOverScoreLabel

func _ready() -> void:
	game_over_menu.visible = false

func update_score(new_score):
	score_label.text = "SCORE: " + str(new_score)
	game_over_score_label.text = "SCORE: " + str(new_score)
	
func update_lives(new_lives):
	lives_label.text = "LIVES: " + str(new_lives)

func game_over():
	game_over_menu.visible = true

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
