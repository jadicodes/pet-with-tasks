extends Node

const _MAXIMUM_MOVES := 10

signal moves_decreased

var moves_remaining := _MAXIMUM_MOVES


func decrease() -> void:
	moves_remaining -= 1
	moves_decreased.emit()


func get_maximum_moves() -> int:
	return _MAXIMUM_MOVES
