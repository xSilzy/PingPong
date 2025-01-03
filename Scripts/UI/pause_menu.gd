extends Node2D
var frame_counter : int
var FRAME_MAX : int = 5
@onready var hud_node = get_parent().game_scene.get_node("HUD")
@onready var buttons = [
	$homeButton, 
	$resumeButton, 
	$retryButton
	]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	frame_counter += 1
	if frame_counter >= FRAME_MAX:
		for button in buttons:
			Global.button_grow(button)
		frame_counter = 0
	
	
	
func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		get_tree().paused = false
		hud_node.show()
		get_viewport().set_input_as_handled()
		get_parent().remove_child(self)


func _on_home_button_pressed():
	get_tree().paused = false
	Sounds.play_sound("buttonClick")
	get_parent().game_scene.queue_free()
	get_parent().add_scene_as_child("main_menu")
	get_parent().remove_child(self)


func _on_resume_button_pressed():
	get_tree().paused = false
	Sounds.play_sound("buttonClick")
	hud_node.show()
	get_parent().remove_child(self)


func _on_retry_button_pressed():
	get_tree().paused = false
	Sounds.play_sound("buttonClick")
	get_parent().reset_game_scene()
	hud_node = get_parent().game_scene.get_node("HUD")
	hud_node.show()
	get_parent().remove_child(self)
	

	
