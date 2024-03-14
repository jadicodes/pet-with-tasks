extends Node2D


func _ready():
	$Player.global_position = $Board.global_position
