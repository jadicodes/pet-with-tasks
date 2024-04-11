extends Node


signal whistle_finished


@onready var _whistle : AudioStreamPlayer = $Whistle


func play_rooster() -> void:
	$Rooster.play()


func play_whistle() -> void:
	_whistle.play()


func check_whistle() -> bool:
	return _whistle.playing


func _on_whistle_song_finished() -> void:
	whistle_finished.emit()
