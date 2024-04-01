class_name PlayerDetector
extends Area2D


var _buttons_list : Array[Button]


func set_buttons_list(list: Array[Button]) -> void:
	_buttons_list = list.duplicate()
	_disable_buttons(true)


func _on_area_entered(_area) -> void:
	_disable_buttons(false)


func _on_area_exited(_area) -> void:
	_disable_buttons(true)


func _disable_buttons(disable: bool) -> void:
	for button in _buttons_list:
		button.disabled = disable
