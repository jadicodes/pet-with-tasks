class_name Tile
extends Node2D

var selected := false
var mouse_entered := false


func _input(event):
	if mouse_entered and event.is_action_released("click"):
		selected = true
		print(selected)


func _on_mouse_catcher_mouse_entered():
	mouse_entered = true


func _on_mouse_catcher_mouse_exited():
	mouse_entered = false
