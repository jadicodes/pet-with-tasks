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
@onready var _buttons_list : Array[Button] = [$FeedButton, $SingButton]


func _ready() -> void:
	_growth_state = Age.BABY
	_player_detector.set_buttons_list(_buttons_list)
	


func _grow_up() -> void:
	if _growth_state == Age.BABY:
		_growth_state = Age.TEEN
	elif _growth_state == Age.TEEN:
		_growth_state = Age.ADULT



