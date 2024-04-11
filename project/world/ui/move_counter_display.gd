extends Node2D


var _color_array: Array[TextureRect] = []


func _ready() -> void:
	MoveCounter.connect("moves_decreased", _update_display)
	var max_moves = MoveCounter.get_maximum_moves()

	for y in max_moves:
		var rect = TextureRect.new()
		var size := 40
		var position_offset :=  size + 20
		rect.position.y = y * position_offset + $Heading.size.y
		rect.size = Vector2(size,size)
		rect.texture = preload("res://world/ui/energy_granola.png")
		rect.scale = Vector2(2,2)
		add_child(rect)
		_color_array.append(rect)


func reset_display() -> void:
	for i in _color_array.size():
		_color_array[i].show()


func _update_display() -> void:
	var moves_remaing = MoveCounter.moves_remaining
	if moves_remaing >= 0:
		_color_array[9-moves_remaing].hide()
