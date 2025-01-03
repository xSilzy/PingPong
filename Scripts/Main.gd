extends Node2D
var GAME_SCENE = preload("res://Scenes/Game.tscn")
var BACKGROUND_SCENE = preload("res://Scenes/UI/Background.tscn")
var MAIN_MENU_SCENE = preload("res://Scenes/UI/Main_menu.tscn")
var OPTIONS_SCENE = preload("res://Scenes/UI/Options.tscn")
var FAIL_MENU_SCENE = preload("res://Scenes/UI/Fail_menu.tscn")
var PAUSE_MENU_SCENE = preload("res://Scenes/UI/Pause_menu.tscn")
var game_instance
var background_instance
var main_menu_instance
var options_instance
var fail_menu_instance
var pause_menu_instance
@onready var game_scene = get_node("Game")
@onready var hud_node = get_node("Game/HUD")



# Called when the node enters the scene tree for the first time.
func _ready():
	Sounds.play_sound("welcome")
	background_instance = BACKGROUND_SCENE.instantiate()
	main_menu_instance = MAIN_MENU_SCENE.instantiate()
	add_child(background_instance)
	add_child(main_menu_instance)
	print_tree_pretty()


func instance_scenes(instanced_scene: String):
	game_instance = GAME_SCENE.instantiate()
	main_menu_instance = MAIN_MENU_SCENE.instantiate()
	options_instance = OPTIONS_SCENE.instantiate()
	fail_menu_instance = FAIL_MENU_SCENE.instantiate()
	pause_menu_instance = PAUSE_MENU_SCENE.instantiate()
	
	return get(instanced_scene + "_instance")



func add_scene_as_child(scene: String):
	var scene_instance = get(scene + "_instance")
	if !is_instance_valid(scene_instance):
		scene_instance = instance_scenes(str(scene))
		print(scene_instance)
	add_child(scene_instance)


func reset_game_scene():
	if is_instance_valid(game_scene):
		game_scene.queue_free()
	game_scene = instance_scenes(str("game"))
	add_child(game_scene)
	game_scene.get_node("HUD").show

	
	
	
