extends Node2D


@onready var _player_detector : PlayerDetector = $PlayerDetector


func handle_selected() -> void:
	if _player_detector.touching_player:
		$PopupMenu.show()


func _on_popup_menu_id_pressed(id):
	print("Yippeeeeeeeeeeee") # it will be yipped
	
