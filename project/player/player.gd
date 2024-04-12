class_name Player
extends Node2D

var _adjacents_array := []

@onready var _sprite: AnimatedSprite2D = $PlayerSprite


func whistle() -> void:
	_sprite.animation = "whistling"


func sleep() -> void:
	_sprite.animation = "sleeping"


func stand() -> void:
	_sprite.animation = "default"


func _on_board_confirmed_move(node) -> void:
	if node in _adjacents_array:
		_adjacents_array = []
		global_position = node.global_position
		MoveCounter.decrease()


func _on_east_area_body_entered(body) -> void:
	_adjacents_array.append(body)


func _on_west_area_body_entered(body) -> void:
	_adjacents_array.append(body)


func _on_north_area_body_entered(body) -> void:
	_adjacents_array.append(body)


func _on_south_area_body_entered(body) -> void:
	_adjacents_array.append(body)

