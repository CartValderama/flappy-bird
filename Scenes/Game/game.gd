extends Node2D

const PIPES = preload("res://Scenes/Pipes/pipes.tscn")

@onready var pipes_container: Node = $PipesContainer
@onready var upper_point: Marker2D = $UpperPoint
@onready var lower_point: Marker2D = $LowerPoint

func _ready() -> void:
	spawn_pipes()
	
func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(_on_plane_died)

func _on_timer_timeout() -> void:
	spawn_pipes()

func spawn_pipes() -> void:
	var generated_pipes = PIPES.instantiate()
	
	var generated_pipes_pos_y: float = randf_range(upper_point.position.y, lower_point.position.y)
	var generated_pipes_pos_x: float = upper_point.position.x
	
	generated_pipes.position = Vector2(generated_pipes_pos_x, generated_pipes_pos_y)
	
	pipes_container.add_child(generated_pipes)

func _on_plane_died() -> void:
	get_tree().paused = true
