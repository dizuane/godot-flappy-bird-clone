class_name Tappy
extends CharacterBody2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer


const JUMP_FORCE: float = -350.0


var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var _jumped: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("fly"): _jumped = true


func _physics_process(delta: float) -> void:
	#velocity.y = 100.0 # pixels per second because...
	## move_and_slide automatically multiplies by the physics timestamp
	## (i.e. delta) - does NOT apply to gravity
	## https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html
	## https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html#characterbody2d
	#move_and_slide()
	velocity.y += _gravity * delta
	
	if _jumped:
		velocity.y = JUMP_FORCE
		_jumped = false
		animation_player.stop()
		animation_player.play("fly")
	
	move_and_slide()
