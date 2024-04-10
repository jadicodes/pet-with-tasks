class_name Pet
extends Node2D

enum Age {
	BABY,
	TEEN,
	ADULT,
}


signal request_tomato


var _baby_image := preload("res://object/pet/hedgehog_baby.png")
var _teen_image := preload("res://object/pet/hedgehog_teen_standing.png")
var _adult_image := preload("res://object/pet/hedgehog_adult_standing.png")

@onready var _feed_button: Button = $FeedButton
@onready var _sing_button: Button = $SingButton

var _had_food := false
var _tomato_count_valid := false:
	set(state):
		_tomato_count_valid = state
		_feed_button.disabled = not (_tomato_count_valid and $PlayerDetector.next_to_player)



# In order for set() to go off, cannot be initially declared
var _growth_state: int: 
	set(state):
		if state == Age.BABY:
			pet_sprite.texture = _baby_image
		elif state == Age.TEEN:
			pet_sprite.texture = _teen_image
		else:
			pet_sprite.texture = _adult_image
		_growth_state = state


@onready var pet_sprite: Sprite2D = $Sprite2D
@onready var _player_detector: PlayerDetector = $PlayerDetector


func _ready() -> void:
	_growth_state = Age.BABY
	_feed_button.disabled = true
	_sing_button.disabled = true


func _grow_up() -> void:
	if _growth_state == Age.BABY:
		_growth_state = Age.TEEN
	elif _growth_state == Age.TEEN:
		_growth_state = Age.ADULT


func _on_sing_button_pressed() -> void:
	MoveCounter.decrease()
	if _had_food:
		_grow_up()
		_had_food = false


func _on_feed_button_pressed() -> void:
	request_tomato.emit()


func _on_inventory_tomato_consumed() -> void:
	_had_food = true
	MoveCounter.decrease()


func _on_inventory_has_tomato():
	_tomato_count_valid = true


func _on_inventory_has_no_tomato():
	_tomato_count_valid = false


func _on_player_detector_next_to_player_changed():
	_sing_button.disabled = not _player_detector.next_to_player
	_feed_button.disabled = not (_tomato_count_valid and  _player_detector.next_to_player)
