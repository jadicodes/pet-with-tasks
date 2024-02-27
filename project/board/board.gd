extends Node2D

var tile_scene = preload("res://board/tile.tscn")
var spaces := []
var width := 4
var height := 4


func _ready():
	for x in width:
		for y in height:
			var node = tile_scene.instantiate()
			node.position.x = x * 266
			node.position.y = y * 266
			add_child(node)
			spaces.append(node)

