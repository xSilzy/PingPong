extends Node
## Player constants
const PADDLE_SPEED : int = 1250  # Speed for both paddles
var score : int = 0
var highscore : int = 0
var shouldPlaySound : bool = true
var config = ConfigFile.new()
var paused: bool = false




func _ready():
	var error = config.load("user://scores.cfg")
	if error != OK:
		print("No save file found. Starting fresh...")
		config.set_value("player", "highscore", 0)
	else:
		print("Save file found.")
		highscore = config.get_value("player", "highscore", 0)



func wait(seconds):
	await get_tree().create_timer(seconds).timeout



func button_grow(button):
	if button.is_hovered():
		button.scale = Vector2(10.5, 10.5)
		if shouldPlaySound == true:
			Sounds.play_sound("buttonHover")
			shouldPlaySound = false
			
	elif button.scale != Vector2(10, 10):
		button.scale = Vector2(10, 10)
		shouldPlaySound = true



func button_shrink(caller):
	caller.scale = Vector2(10, 10)
	
	
func save_data():
	if config.get_value("player", "highscore", 0) < highscore:
		config.set_value("player", "highscore", highscore)
		config.save("user://scores.cfg")
