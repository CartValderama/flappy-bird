extends Node

const MAIN = preload("res://Scenes/Main/main.tscn")
const GAME = preload("res://Scenes/Game/game.tscn")
const TRANSITION = preload("res://Scenes/Transition/transition.tscn")
const FADE_TRANSITION = preload("res://Scenes/Transition/fade_transition.tscn")

var next_scene: PackedScene

func add_fade_transition() -> void:
	var fade_transition = FADE_TRANSITION.instantiate()
	add_child(fade_transition)

func load_main_scene() -> void:
	next_scene = MAIN
	
	# simpler transition
	#get_tree().change_scene_to_packed(TRANSITION)
	add_fade_transition()

func load_game_scene() -> void:
	next_scene = GAME
	
	# simpler transition
	#get_tree().change_scene_to_packed(TRANSITION)
	add_fade_transition()
