class_name Tile
extends Node2D

signal confirmed

var _selected := false
var _mouse_entered := false
var _holding := false


func _input(event) -> void:
	if _selected and _mouse_entered and event.is_action_released("click"):
		if not _holding:
			confirmed.emit()
		_selected = false
		$Sprite2D.modulate = Color.WHITE

	elif _mouse_entered and event.is_action_released("click"):
		_selected = true
		$Sprite2D.modulate = Color.YELLOW
	
	elif event.is_action_released("click"):
		_selected = false
		$Sprite2D.modulate = Color.WHITE


# It's an assumption that the Tile is square
func get_side_length() -> int:
	return $Sprite2D.get_rect().size.x


func _on_mouse_catcher_mouse_entered() -> void:
	_mouse_entered = true


func _on_mouse_catcher_mouse_exited() -> void:
	_mouse_entered = false


func _on_object_detector_area_entered(area: Area2D):
	_holding = true
