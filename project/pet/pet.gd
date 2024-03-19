extends Node2D


func _on_board_confirmed_first_option():
	_grow_up()


func _grow_up():
	modulate = Color.RED
