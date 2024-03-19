extends Node2D


signal confirmed_first_option
signal confirmed_move


var _tile_scene = preload("res://board/tile.tscn")
var _spaces := []
var _width := 4
var _height := 4


func _ready():
	for x in _width:
		for y in _height:
			var node : Tile = _tile_scene.instantiate()
			var position_offset := node.get_side_length() + 20
			node.position.x = x * position_offset
			node.position.y = y * position_offset
			add_child(node)
			node.connect("confirmed", pass_confirmed_to_world.bind(node))
			node.connect("first_option_selected", pass_first_option_selected_to_world.bind())
			_spaces.append(node)


func pass_confirmed_to_world(node):
	confirmed_move.emit(node)


func pass_first_option_selected_to_world():
	confirmed_first_option.emit()


func get_pet_tile():
	var _pet_spots = _spaces.duplicate()
	_pet_spots.erase(_pet_spots[0])
	return _pet_spots.pick_random()
