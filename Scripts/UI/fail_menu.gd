extends Node2D

var frame_counter : int
var FRAME_MAX : int = 5
@onready var buttons = [
	$homeButton, 
	$retryButton, 
	$quitButton
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	frame_counter += 1
	if frame_counter >= FRAME_MAX:
		for button in buttons:
			Global.button_grow(button)
		frame_counter = 0
		$currentPlayerScore.text = str("Current Score: ", Global.score)
		$highscore.text = str("Highscore: ", Global.config.get_value("player","highscore"))



func _on_home_button_button_down():
	Sounds.play_sound("buttonClick")
	get_parent().add_scene_as_child("main_menu")
	get_parent().remove_child(self)



func _on_retry_button_button_down(): 
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Sounds.play_sound("buttonClick")
	get_parent().add_scene_as_child("game")
	get_parent().remove_child(self)



func _on_quit_button_button_down():
	Sounds.play_sound("buttonClick")
	await Global.wait(0.1)
	get_tree().quit()
