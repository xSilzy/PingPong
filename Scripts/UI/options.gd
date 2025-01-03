extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	pass


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		Sounds.play_sound("buttonClick")
		get_parent().add_scene_as_child("main_menu")
		get_parent().remove_child(self)
