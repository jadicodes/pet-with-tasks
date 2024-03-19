extends Node2D


func _ready():
	$Player.global_position = $Board.global_position
	$Pet.global_position = $Board.get_pet_tile().global_position
