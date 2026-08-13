extends Node


var _score: int = 0
var _high_score: int = 0


const SAVE_PATH: String = "user://tappy_game.dat"


var high_score: int:
	get:
		return _high_score
	set(value):
		if value > _high_score:
			_high_score = value
			save_to_file()


func _on_tappy_died() -> void:
	high_score = _score
	reset_score()


func _ready() -> void:
	load_from_file()
	SignalHub.tappy_died.connect(_on_tappy_died)


func reset_score() -> void:
	_score = 0


func add_point() -> void:
	_score += 1
	SignalHub.emit_point_scored(_score)


func save_to_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if !file:
		push_error("save_to_file: %s - no file found" % SAVE_PATH)
		return
	
	file.store_32(_high_score)

func load_from_file():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if !file:
		push_warning("load_from_file: %s - no file found" % SAVE_PATH)
		return
	
	high_score = file.get_32()
