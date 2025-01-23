extends Node2D

var frame_counter : int
var FRAME_MAX : int = 5
@onready var buttons = [
	$displayOptions, 
	$soundOptions, 
	$inputOptions
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	frame_counter += 1
	if frame_counter >= FRAME_MAX:
		for button in buttons:
			if !button.has_focus():
				Global.button_grow(button)
			elif button.scale != Vector2(9, 9):
				button.scale = Vector2(9, 9)

		frame_counter = 0


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		Sounds.play_sound("buttonClick")
		get_parent().add_scene_as_child("main_menu")
		get_parent().remove_child(self)


func _on_display_options_button_down():
	Sounds.play_sound("buttonClick")


func _on_sound_options_button_down():
	Sounds.play_sound("buttonClick")


func _on_input_options_button_down():
	Sounds.play_sound("buttonClick")
