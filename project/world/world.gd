extends Node2D

@onready var _board : Board = $Board
@onready var _pet : Pet = $Pet
@onready var _crop : Crop = $Crop
@onready var _click_stopper : ColorRect = $ClickStopper


func _ready() -> void:
	MoveCounter.connect("day_ended", _move_player_to_start)
	SFX.connect("whistle_finished", _move_player_to_start)
	_move_player_to_start()
	_pet.global_position = _board.get_unoccupied_tile().global_position
	_crop.global_position = _board.get_unoccupied_tile().global_position


func _move_player_to_start() -> void:
	_click_stopper.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$MoveCounterDisplay.reset_display()
	MoveCounter.reset()
	$Player.global_position = _board.global_position
	_pet.wake_up()


func _on_pet_sung_to_sleep() -> void:
	_click_stopper.mouse_filter = Control.MOUSE_FILTER_STOP
	SFX.play_whistle()
	$AnimationPlayer.play("nighttime")
	#$AnimationPlayer.play("daytime")
