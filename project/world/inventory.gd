extends Node2D


var _tomato_count := 0

@onready var _tomato_sprite: Sprite2D = $Tomato
@onready var _tomato_label: Label = $Tomato/TomatoLabel


func _ready() -> void:
	_tomato_sprite.hide()


func increase_tomato_count() -> void:
	_tomato_count += 1
	_display_tomato()
	_update_tomato_label()


func get_tomato_count() -> int:
	return _tomato_count


func _display_tomato() -> void:
	if _tomato_count >= 1:
		_tomato_sprite.show()
	else:
		_tomato_sprite.hide()


func _update_tomato_label() -> void:
	_tomato_label.text = str(_tomato_count)

