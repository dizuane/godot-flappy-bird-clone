extends Node


signal tappy_died
signal point_scored(score: int)

func emit_tappy_died() -> void:
	tappy_died.emit()


func emit_point_scored(score: int) -> void:
	point_scored.emit(score)
