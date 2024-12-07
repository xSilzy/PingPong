extends Node
## Player constants
const PADDLE_SPEED : int = 1250  # Speed for both paddles
var score : int = 0
var highscore : int = 0
var shouldPlaySound : bool = true


func _ready():
	pass


func wait(seconds):
	await get_tree().create_timer(seconds).timeout
	
func button_grow(button):
	if button.is_hovered():
		button.scale = Vector2(10.5, 10.5)
		if shouldPlaySound == true:
			Sounds.play_sound("buttonHover")
			shouldPlaySound = false
			print("HOVERED")
	elif button.scale != Vector2(10, 10):
		button.scale = Vector2(10, 10)
		shouldPlaySound = true
		print("NOT HOVERED")



func button_shrink(caller):
	caller.scale = Vector2(10, 10)
