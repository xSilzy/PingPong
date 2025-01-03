extends Node2D
var frame_counter : int
var FRAME_MAX : int = 5
@onready var buttons = [
	$playButton, 
	$optionsButton, 
	$quitButton
	]






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	frame_counter += 1
	if frame_counter >= FRAME_MAX:
		for button in buttons:
			Global.button_grow(button)
		frame_counter = 0



func _on_play_button_pressed():
	Sounds.play_sound("buttonClick")
	get_parent().add_scene_as_child("game")
	get_parent().remove_child(self)
	


func _on_options_button_pressed():
	Sounds.play_sound("buttonClick")
	get_parent().add_scene_as_child("options")
	get_parent().remove_child(self)



func _on_quit_button_pressed():
	Sounds.play_sound("buttonClick")
	await Global.wait(0.1)
	get_tree().quit()
	
