extends Node2D

@onready var _board : Board = $Board
@onready var _pet : Pet = $Pet
@onready var _crop : Crop = $Crop
@onready var _click_stopper : ColorRect = $ClickStopper
@onready var _animation : AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	_animation.play("daytime")
	MoveCounter.connect("day_ended", _end_day)
	SFX.connect("whistle_finished", _end_day)
	_reset()
	_pet.global_position = _board.get_unoccupied_tile().global_position
	_crop.global_position = _board.get_unoccupied_tile().global_position


func _reset() -> void:
	$MoveCounterDisplay.reset_display()
	MoveCounter.reset()
	$Player.global_position = _board.global_position
	_pet.wake_up()


func _on_pet_sung_to_sleep() -> void:
	_click_stopper.mouse_filter = Control.MOUSE_FILTER_STOP
	SFX.play_whistle()


func _end_day() -> void:
	_click_stopper.mouse_filter = Control.MOUSE_FILTER_STOP
	_animation.play("nighttime")


func _on_animation_player_animation_finished(anim_name: String) -> void:
	if anim_name == "nighttime":
		_reset()
		_animation.play("daytime")
	elif anim_name == "daytime":
		_click_stopper.mouse_filter = Control.MOUSE_FILTER_IGNORE
