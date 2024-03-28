class_name Board
extends Node2D


signal confirmed_move


var _tile_scene = preload("res://board/tile.tscn")
var _spaces := []
var _unoccupied_spaces : Array
var _width := 4
var _height := 4


func _ready() -> void:
	for x in _width:
		for y in _height:
			var tile : Tile = _tile_scene.instantiate()
			var position_offset := tile.get_side_length() + 10
			tile.position.x = x * position_offset
			tile.position.y = y * position_offset
			add_child(tile)
			tile.connect("confirmed", pass_confirmed_to_world.bind(tile))
			_spaces.append(tile)
	_unoccupied_spaces = _spaces.duplicate()
	# Remove first spot, player's spot
	_unoccupied_spaces.erase(_unoccupied_spaces[0])


func pass_confirmed_to_world(node) -> void:
	confirmed_move.emit(node)


func get_unoccupied_tile() -> Tile:
	var result: Tile = _unoccupied_spaces.pick_random()
	_unoccupied_spaces.erase(result)
	return result
