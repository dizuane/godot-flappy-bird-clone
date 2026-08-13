class_name Pipes
extends Node2D

const SCROLL_SPEED: float = 120.0 # px/s


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var upper: Area2D = $Upper
@onready var lower: Area2D = $Lower
@onready var laser: Area2D = $Laser
@onready var score_sound: AudioStreamPlayer = $ScoreSound


func _on_screen_exited() -> void:
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:
	if body is Tappy: body.die()

func _on_laser_entered(_body: Node2D) -> void:
	ScoreManager.add_point()
	score_sound.play()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier_2d.connect("screen_exited", _on_screen_exited)
	laser.body_entered.connect(_on_laser_entered, CONNECT_ONE_SHOT) # one shot to prevent accidently double scoring
	upper.body_entered.connect(_on_pipe_body_entered)
	lower.body_entered.connect(_on_pipe_body_entered)



func _physics_process(delta: float) -> void:
	position.x -= SCROLL_SPEED * delta
