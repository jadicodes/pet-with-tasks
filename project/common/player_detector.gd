class_name PlayerDetector
extends Area2D

signal next_to_player_changed

var next_to_player: bool


func _on_area_entered(_area) -> void:
	next_to_player = true
	next_to_player_changed.emit()


func _on_area_exited(_area) -> void:
	next_to_player = false
	next_to_player_changed.emit()
