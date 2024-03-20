extends Node2D

@onready var _board = $Board
@onready var _pet = $Pet

func _ready() -> void:
	$Player.global_position = _board.global_position
	_pet.global_position = _board.get_pet_tile().global_position
	_pet.set_popup_menu_position(_pet.position)
