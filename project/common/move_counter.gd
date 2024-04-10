extends Node

const _MAXIMUM_MOVES := 10

var moves_remaining := _MAXIMUM_MOVES


func decrease() -> void:
	moves_remaining -= 1
	print(moves_remaining)
