extends Control

@onready var score_label: Label = $MarginContainer/ScoreLabel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump", false):
		GameManager.load_game_scene()
		
func _ready() -> void:
	get_tree().paused = false
	score_label.text = "%04d" % ScoreManager.high_score
