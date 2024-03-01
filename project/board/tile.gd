class_name Tile
extends Node2D

var _selected := false
var _mouse_entered := false


func _input(event) -> void:
	if _mouse_entered and event.is_action_released("click"):
		_selected = true
		print(_selected)


# It's an assumption that the Tile is square
func get_side_length() -> int:
	return $Sprite2D.get_rect().size.x


func _on_mouse_catcher_mouse_entered() -> void:
	_mouse_entered = true


func _on_mouse_catcher_mouse_exited() -> void:
	_mouse_entered = false
