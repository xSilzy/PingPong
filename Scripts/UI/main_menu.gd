extends Node2D
var MAIN_SCENE = preload("res://Scenes/Main.tscn")
var main_instance
var frame_counter : int
var frame_max : int = 5
@onready var buttons = [
	$playButton, 
	$optionsButton, 
	$quitButton
	]
	


# Called when the node enters the scene tree for the first time.
func _ready():
	main_instance = MAIN_SCENE.instantiate()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	frame_counter += 1
	if frame_counter >= frame_max:
		for button in buttons:
			Global.button_grow(button)
		frame_counter = 0
		
	


func _on_play_button_pressed():
	get_parent().add_scene_as_child("game")
	self.queue_free()
	Sounds.play_sound("buttonClick")
	


func _on_options_button_pressed():
	get_parent().add_scene_as_child("options")
	self.queue_free()
	Sounds.play_sound("buttonClick")


func _on_quit_button_pressed():
	get_tree().quit()
	Sounds.play_sound("buttonClick")

