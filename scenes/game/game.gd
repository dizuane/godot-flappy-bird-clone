class_name Game
extends Node


const PIPES = preload("uid://ci3wxyb0w57he")


@onready var spawn_timer: Timer = $SpawnTimer
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn
@onready var pipes_holder: Node = $PipesHolder


func _spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	new_pipes.position.x = upper_spawn.position.x
	new_pipes.position.y = randf_range(upper_spawn.position.y, lower_spawn.position.y)
	pipes_holder.add_child(new_pipes)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.timeout.connect(_spawn_pipes)
	_spawn_pipes()
