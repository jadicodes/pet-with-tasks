extends Node2D

@onready var _board = $Board

func _ready() -> void:
	$Player.global_position = _board.global_position
	$Pet.global_position = _board.get_pet_tile().global_position
