class_name GameUI
extends Control


@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var press_jump_label: Label = $MarginContainer/PressJumpLabel
@onready var sound: AudioStreamPlayer = $Sound
@onready var label_change_timer: Timer = $LabelChangeTimer


func _on_label_change_timer_timeout() -> void:
	game_over_label.hide()
	press_jump_label.show()


func _unhandled_input(event: InputEvent) -> void:
	if (
		event.is_action_pressed("test") or
		(event.is_action_pressed("fly") and press_jump_label.visible)
	):
		GameManager.load_main_screen()


func _ready() -> void:
	SignalHub.tappy_died.connect(game_over)


func game_over() -> void:
	game_over_label.show()
	sound.play()
	label_change_timer.timeout.connect(_on_label_change_timer_timeout, CONNECT_ONE_SHOT)
	label_change_timer.start()
