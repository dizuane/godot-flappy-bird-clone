extends Node


var _score: int = 0
var _high_score: int = 0


var score: int:
	get:
		return _score
	set(value):
		_score = value

var high_score: int:
	get:
		return _high_score


func add_point() -> void:
	_score += 1
	if _high_score < _score:
		_high_score = _score
	
	SignalHub.emit_point_scored(_score)
