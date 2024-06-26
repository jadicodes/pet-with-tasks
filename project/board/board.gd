class_name Board
extends Node2D


signal confirmed_move


var _tile_scene = preload("res://board/tile.tscn")
var _spaces := []
var _item_space := [ 8, 14 ]
var _width := 4
var _height := 4


func _ready() -> void:
	for x in _width:
		for y in _height:
			var tile : Tile = _tile_scene.instantiate()
			var position_offset := tile.get_side_length() + 20
			tile.position.x = x * position_offset
			tile.position.y = y * position_offset
			add_child(tile)
			tile.connect("confirmed", pass_confirmed_to_world.bind(tile))
			_spaces.append(tile)


func pass_confirmed_to_world(node) -> void:
	confirmed_move.emit(node)


func get_unoccupied_tile() -> Tile:
	var spot = _item_space.pick_random()
	var result: Tile = _spaces[spot]
	_item_space.erase(spot)
	return result
