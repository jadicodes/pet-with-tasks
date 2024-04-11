extends Node

const _MAXIMUM_MOVES := 10

signal day_ended
signal moves_decreased

var moves_remaining := _MAXIMUM_MOVES


func decrease() -> void:
	moves_remaining -= 1
	moves_decreased.emit()
	_check_if_zero()


func reset() -> void:
	moves_remaining = _MAXIMUM_MOVES


func _check_if_zero() -> void:
	if moves_remaining <= 0:
		day_ended.emit()
		reset()


func get_maximum_moves() -> int:
	return _MAXIMUM_MOVES
