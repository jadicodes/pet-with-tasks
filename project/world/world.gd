extends Node2D

@onready var _board = $Board
@onready var _pet = $Pet
@onready var _crop = $Crop

func _ready() -> void:
	$Player.global_position = _board.global_position
	_pet.global_position = _board.get_unoccupied_tile().global_position
	_pet.set_popup_menu_position(_pet.position)
	_crop.global_position = _board.get_unoccupied_tile().global_position
	_crop.set_popup_menu_position(_crop.position)
