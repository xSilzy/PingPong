extends Node2D
var MAIN_SCENE = preload("res://Scenes/Main.tscn")
var main_instance
# Called when the node enters the scene tree for the first time.
func _ready():
	main_instance = MAIN_SCENE.instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_parent().add_scene_as_child("game")
	self.queue_free()


func _on_options_button_pressed():
	get_parent().add_scene_as_child("options")
	self.queue_free()

func _on_quit_button_pressed():
	get_tree().quit()
