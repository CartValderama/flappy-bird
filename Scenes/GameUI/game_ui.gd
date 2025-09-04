extends Control

const GAME_OVER = preload("res://Assets/audio/game_over.wav")

@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var timer: Timer = $Timer
@onready var scoring_label: Label = $MarginContainer/ScoringLabel
@onready var sound: AudioStreamPlayer = $Sound

var _score: int = 0

func _ready() -> void:
	_score = 0

func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_died)
	SignalHub.on_point_scored.connect(on_point_scored)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.load_main_scene()
	elif press_space_label.visible and Input.is_action_just_pressed("jump"):
		ScoreManager.high_score = _score
		GameManager.load_main_scene()

func _on_plane_died() -> void:
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()
	game_over_label.show()
	timer.start(2)

func on_point_scored() -> void:
	_score += 1
	scoring_label.text = "%04d" % _score
	sound.play()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()
	
