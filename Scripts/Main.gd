extends Node2D
var MAIN_SCENE = preload("res://Scenes/UI/Main_menu.tscn")
var GAME_SCENE = preload("res://Scenes/Game.tscn")
var BACKGROUND_SCENE = preload("res://Scenes/UI/Background.tscn")
var MAIN_MENU_SCENE = preload("res://Scenes/UI/Main_menu.tscn")
var OPTIONS_SCENE = preload("res://Scenes/UI/Options.tscn")
var FAIL_MENU_SCENE = preload("res://Scenes/UI/Fail_menu.tscn")
var game_instance
var background_instance
var main_menu_instance
var options_instance
var fail_menu_instance
var main_instance



# Called when the node enters the scene tree for the first time.
func _ready():
	Sounds.play_sound("welcome")
	background_instance = BACKGROUND_SCENE.instantiate()
	main_menu_instance = MAIN_MENU_SCENE.instantiate()
	add_child(background_instance)
	add_child(main_menu_instance)



func instance_scenes(instanced_scene):
	main_instance = MAIN_SCENE.instantiate()
	game_instance = GAME_SCENE.instantiate()
	background_instance = BACKGROUND_SCENE.instantiate()
	main_menu_instance = MAIN_MENU_SCENE.instantiate()
	options_instance = OPTIONS_SCENE.instantiate()
	fail_menu_instance = FAIL_MENU_SCENE.instantiate()
	
	return get(instanced_scene + "_instance")



func add_scene_as_child(scene):
	var scene_instance = get(scene + "_instance")
	if !is_instance_valid(scene_instance):
		scene_instance = instance_scenes(str(scene))
		print(scene_instance)
	self.add_child(scene_instance)
