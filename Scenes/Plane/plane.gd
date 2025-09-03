extends CharacterBody2D

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var jump_power: float = -350

@onready var plane_jump_anim: AnimationPlayer = $AnimationPlayer
@onready var plane_propeler_anim: AnimatedSprite2D = $AnimatedSprite2D


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
		velocity.y = jump_power
		
		
func die() -> void:
	plane_propeler_anim.stop()
	set_physics_process(false)
