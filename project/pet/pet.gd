extends Node2D


var _touching_player : = false


func _grow_up() -> void:
	modulate = Color.RED


func _on_board_confirmed_pet_selected() -> void:
	if _touching_player:
		$PopupMenu.show()


func _on_popup_menu_id_pressed(id) -> void:
	if id == 0:
		_grow_up()


func _on_area_2d_area_entered(_area) -> void:
	_touching_player = true


func _on_area_2d_area_exited(_area) -> void:
	_touching_player = false
