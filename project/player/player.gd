extends Node2D

var _adjacents_array := []


func _find_selected_from_array():
	var end_result = null

	for thing in _adjacents_array:
		if thing._selected:
			end_result = thing
	return end_result


func _on_east_area_body_entered(body):
	_adjacents_array.append(body)


func _on_west_area_body_entered(body):
	_adjacents_array.append(body)


func _on_north_area_body_entered(body):
	_adjacents_array.append(body)


func _on_south_area_body_entered(body):
	_adjacents_array.append(body)


func _on_board_confirmed_move(node):
	if node in _adjacents_array:
		_adjacents_array = []
		global_position = node.global_position
