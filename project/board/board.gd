extends Node2D

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
			_spaces.append(node)

