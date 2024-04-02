extends Node2D


signal has_tomato
signal has_no_tomato
signal tomato_consumed


var _tomato_count := 0

@onready var _tomato_sprite: Sprite2D = $Tomato
@onready var _tomato_label: Label = $Tomato/TomatoLabel


func _ready() -> void:
	_tomato_sprite.hide()


func _change_tomato_count(amount: int) -> void:
	_tomato_count += amount
	_display_tomato()
	_update_tomato_label()
	if _tomato_count > 0:
		has_tomato.emit()
	else:
		has_no_tomato.emit()


func _display_tomato() -> void:
	if _tomato_count >= 1:
		_tomato_sprite.show()
	else:
		_tomato_sprite.hide()


func _update_tomato_label() -> void:
	_tomato_label.text = str(_tomato_count)


func _on_crop_harvested() -> void:
	_change_tomato_count(1)


func _on_pet_request_tomato() -> void:
	_change_tomato_count(-1)
	tomato_consumed.emit()
