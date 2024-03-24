class_name PlayerDetector 
extends Area2D


var touching_player := false


func _on_area_entered(_area: Area2D) -> void:
	touching_player = true


func _on_area_exited(_area: Area2D) ->  void:
	touching_player = false
