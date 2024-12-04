extends Node2D
var GAME_SCENE = preload("res://Scenes/Game.tscn")
var BACKGROUND_SCENE = preload("res://Scenes/UI/Background.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var game_instance = GAME_SCENE.instantiate()
	var background_instance = BACKGROUND_SCENE.instantiate()
	add_child(background_instance)
	add_child(game_instance)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
