extends Node

const MAIN = preload("uid://kfony601y874")
const GAME = preload("uid://bn8y6p223ccrm")


func load_main_screen() -> void:
	get_tree().change_scene_to_packed(MAIN)


func load_game_screen() -> void:
	get_tree().change_scene_to_packed(GAME)
