extends Node2D

enum Age {
	BABY,
	TEEN,
	ADULT,
}

var _baby_image := preload("res://pet/hedgehog_baby.png")
var _teen_image := preload("res://icon.svg")
var _adult_image := preload("res://pet/hedgehog_adult_standing.png")

var _touching_player := false
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

@onready var pet_sprite : Sprite2D = $Sprite2D


func _ready() -> void:
	_growth_state = Age.BABY


func set_popup_menu_position(pos : Vector2) -> void:
	$PopupMenu.position = pos


func _grow_up() -> void:
	if _growth_state == Age.BABY:
		_growth_state = Age.TEEN
	elif _growth_state == Age.TEEN:
		_growth_state = Age.ADULT


func handle_selected() -> void:
	if _touching_player:
		$PopupMenu.show()


func _on_popup_menu_id_pressed(id: int) -> void:
	if id == 0:
		_grow_up()


func _on_area_2d_area_entered(_area) -> void:
	_touching_player = true


func _on_area_2d_area_exited(_area) -> void:
	_touching_player = false
