extends Node2D


var _color_array : Array[ColorRect] = []


func _ready() -> void:
	MoveCounter.connect("moves_decreased", _update_display)
	var max_moves = MoveCounter.get_maximum_moves()

	for y in max_moves:
			var rect = ColorRect.new()
			var size := 40
			var position_offset :=  size + 10
			rect.position.y = y * position_offset + $Heading.size.y
			rect.size = Vector2(size,size)
			rect.color = Color.SEA_GREEN
			add_child(rect)
			_color_array.append(rect)


func reset_display() -> void:
	for i in MoveCounter.moves_remaining:
		_color_array[i].show()


func _update_display() -> void:
	var moves_remaing = MoveCounter.moves_remaining
	if moves_remaing >= 0:
		_color_array[9-moves_remaing].hide()
