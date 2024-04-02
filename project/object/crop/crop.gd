class_name Crop
extends Node2D

signal harvested

enum Growth {
	NOT_READY,
	READY,
}

var _ready_image := preload("res://object/crop/crop_grown.png")
var _not_ready_image := preload("res://object/crop/crop_baby.png")

# In order for set() to go off, cannot be initially declared
var _growth_state: int: 
	set(state):
		if state == Growth.NOT_READY:
			crop_sprite.texture = _not_ready_image
			_button.text = "Grow"
		elif state == Growth.READY:
			crop_sprite.texture = _ready_image
			_button.text = "Harvest"
		_growth_state = state

@onready var crop_sprite: Sprite2D = $Sprite2D
@onready var _player_detector: PlayerDetector = $PlayerDetector
@onready var _button: Button = $Button


func _ready() -> void:
	_growth_state = Growth.NOT_READY
	_button.disabled = true


func _grow_up() -> void:
	if _growth_state == Growth.NOT_READY:
		_growth_state = Growth.READY
	elif _growth_state == Growth.READY:
		_growth_state = Growth.NOT_READY
		harvested.emit()


func _on_player_detector_next_to_player_changed():
	_button.disabled = not _player_detector.next_to_player
