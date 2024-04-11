extends Node


signal whistle_finished

@onready var _whistle : AudioStreamPlayer = $Whistle_song


func play_whistle() -> void:
	_whistle.play()


func _on_whistle_song_finished():
	whistle_finished.emit()


func check_whistle() -> bool:
	return _whistle.playing
