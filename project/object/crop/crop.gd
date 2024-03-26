extends Node2D


@onready var _player_detector : PlayerDetector = $PlayerDetector
@onready var _popup : PopupMenu = $PopupMenu


func handle_selected() -> void:
	if _player_detector.touching_player:
		$PopupMenu.show()


func _on_popup_menu_id_pressed(_id):
	print("Yippeeeeeeeeeeee") # it will be yipped

func set_popup_menu_position(pos : Vector2) -> void:
	_popup.position = pos
