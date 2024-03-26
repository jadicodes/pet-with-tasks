extends Node2D

enum Age {
	NOT_READY,
	READY,
}

var _ready_image := preload("res://object/crop/crop_grown.png")
var _not_ready_image := preload("res://icon.svg")

@onready var crop_sprite : Sprite2D = $Sprite2D
@onready var _player_detector : PlayerDetector = $PlayerDetector
@onready var _popup : PopupMenu = $PopupMenu

# In order for set() to go off, cannot be initially declared
var _growth_state: int: 
	set(state):
		if state == Age.NOT_READY:
			crop_sprite.texture = _not_ready_image
			_popup.set_item_text(0, "Grow")
		elif state == Age.READY:
			crop_sprite.texture = _ready_image
			_popup.set_item_text(0, "Harvest")
		_growth_state = state


func _ready() -> void:
	_growth_state = Age.NOT_READY


func handle_selected() -> void:
	if _player_detector.touching_player:
		$PopupMenu.show()


func _on_popup_menu_id_pressed(id) -> void:
	if id == 0:
		_grow_up()


func set_popup_menu_position(pos : Vector2) -> void:
	_popup.position = pos


func _grow_up() -> void:
	if _growth_state == Age.NOT_READY:
		_growth_state = Age.READY
	elif _growth_state == Age.READY:
		_growth_state = Age.NOT_READY
