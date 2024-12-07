extends Node
## Player constants
const PADDLE_SPEED : int = 1250  # Speed for both paddles
var score : int = 0
var highscore : int = 0



func _ready():
	pass



func wait(seconds):
	await get_tree().create_timer(seconds).timeout
