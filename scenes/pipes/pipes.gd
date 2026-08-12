class_name Pipes
extends Node2D

const SCROLL_SPEED: float = 120.0 # px/s


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func _on_screen_exited() -> void:
	queue_free()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_on_screen_notifier_2d.connect("screen_exited", _on_screen_exited)


func _physics_process(delta: float) -> void:
	position.x -= SCROLL_SPEED * delta
