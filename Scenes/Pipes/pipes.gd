extends Node2D

@onready var laser: Area2D = $Laser

const PIPE_SPEED: float = 120
const OFF_SCREEN_MARGIN: float = 100

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.x -= PIPE_SPEED * delta
	
	if position.x < get_viewport_rect().position.x - OFF_SCREEN_MARGIN:
		ensure_pipe_deletion()

func screen_exited() -> void:
	ensure_pipe_deletion()
	
func ensure_pipe_deletion() -> void:
	set_process(false)
	queue_free()

func _on_pipe_body_entered(body: Node2D) -> void:
	if body is PlaneTappy:
		body.die()

func _on_laser_body_entered(body: Node2D) -> void:
	if body is PlaneTappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.emit_on_point_scored()
