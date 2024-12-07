extends Node2D
var GAME_SCENE = preload("res://Scenes/Game.tscn")
var BACKGROUND_SCENE = preload("res://Scenes/UI/Background.tscn")
var MAIN_MENU_SCENE = preload("res://Scenes/UI/main_menu.tscn")
var OPTIONS_SCENE = preload("res://Scenes/UI/Options.tscn")
var game_instance
var background_instance
var main_menu_instance
var options_instance




# Called when the node enters the scene tree for the first time.
func _ready():
	game_instance = GAME_SCENE.instantiate()
	background_instance = BACKGROUND_SCENE.instantiate()
	main_menu_instance = MAIN_MENU_SCENE.instantiate()
	options_instance = OPTIONS_SCENE.instantiate()
	
	add_child(background_instance)
	add_child(main_menu_instance)
	print_tree_pretty()



func add_scene_as_child(scene):
	var scene_instance = get(scene + "_instance")
	get_parent().add_child(scene_instance)
	print_tree_pretty()
