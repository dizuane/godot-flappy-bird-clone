class_name Laser
extends Area2D


func _on_laser_entered(_body: Node2D) -> void:
	print("Point scored")



func _ready() -> void:
	body_entered.connect(_on_laser_entered, CONNECT_ONE_SHOT) # one shot to prevent accidental double scoring
