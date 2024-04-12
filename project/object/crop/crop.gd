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
		elif state == Growth.READY:
			crop_sprite.texture = _ready_image
		_growth_state = state

@onready var crop_sprite: Sprite2D = $Sprite2D
@onready var _player_detector: PlayerDetector = $PlayerDetector
@onready var _grow_button: TextureButton = $GrowButton
@onready var _harvest_button: TextureButton = $HarvestButton


func _ready() -> void:
	_growth_state = Growth.NOT_READY
	_grow_button.disabled = true
	_harvest_button.disabled = true


func _on_player_detector_next_to_player_changed():
	var disabled_state := not _player_detector.next_to_player
	_grow_button.disabled = disabled_state
	_harvest_button.disabled = disabled_state


func _on_grow_button_pressed():
	MoveCounter.decrease()
	_growth_state = Growth.READY
	_grow_button.hide()
	_harvest_button.show()


func _on_harvest_button_pressed():
	MoveCounter.decrease()
	_growth_state = Growth.NOT_READY
	harvested.emit()
	
	_grow_button.show()
	_harvest_button.hide()
