class_name Pet
extends Node2D

enum Age {
	BABY,
	TEEN,
	ADULT,
}

var _baby_image := preload("res://object/pet/hedgehog_baby.png")
var _teen_image := preload("res://object/pet/hedgehog_teen_standing.png")
var _adult_image := preload("res://object/pet/hedgehog_adult_standing.png")
var has_tomato = false

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
@onready var _feed_button: Button = $FeedButton
@onready var _sleep_button: Button = $SleepButton


func _ready() -> void:
	_growth_state = Age.BABY
	_feed_button.disabled = true
	_sleep_button.disabled = true


func _grow_up() -> void:
	if _growth_state == Age.BABY:
		_growth_state = Age.TEEN
	elif _growth_state == Age.TEEN:
		_growth_state = Age.ADULT



func _on_feed_button_pressed():
	_grow_up()


func _on_player_detector_area_entered(_area):
	if has_tomato == true:
		_feed_button.disabled = false
	_sleep_button.disabled = false


func _on_player_detector_area_exited(_area):
	_feed_button.disabled = true
	_sleep_button.disabled = true


func _on_inventory_tomato_collected():
	has_tomato = true
