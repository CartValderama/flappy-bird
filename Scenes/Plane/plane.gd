extends CharacterBody2D

class_name PlaneTappy

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var JUMP_POWER: float = -350

@onready var plane_jump_anim: AnimationPlayer = $AnimationPlayer
@onready var plane_propeler_anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sounds: AudioStreamPlayer = $EngineSounds

func _ready() -> void:
	pass 

func _physics_process(delta: float) -> void:
	jump(delta)
	
	move_and_slide()
	
	if is_on_floor():
		die()

func jump(delta: float) -> void:
	velocity.y += _gravity * delta
	
	if Input.is_action_just_pressed("jump"):
		plane_jump_anim.play("jump")
		velocity.y = JUMP_POWER
		
func die() -> void:
	plane_propeler_anim.stop()
	set_physics_process(false)
	SignalHub.emit_on_plane_died()
	engine_sounds.stop()
