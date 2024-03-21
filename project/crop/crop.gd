extends Node2D


var _touching_player := false


func handle_selected() -> void:
	if _touching_player:
		$PopupMenu.show()


func _on_popup_menu_id_pressed(id):
	print("Yippeeeeeeeeeeee") # it will be yipped
	


func _on_area_2d_area_entered(_area):
	_touching_player = true


func _on_area_2d_area_exited(_area):
	_touching_player = false
