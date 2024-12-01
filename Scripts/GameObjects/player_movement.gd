extends StaticBody2D

# Variables for screen height and paddle height
var win_height : int
var player_height : int

func _ready():
	# Initialize screen height and calculate scaled paddle height
	win_height = get_viewport_rect().size.y
	player_height = $playerSprite.texture.get_height() * 10

func _process(delta):
	# Handle player input for paddle movement
	if Input.is_action_pressed("ui_up"):
		position.y -= Global.PADDLE_SPEED * delta  # Move paddle up

	if Input.is_action_pressed("ui_down"):
		position.y += Global.PADDLE_SPEED * delta  # Move paddle down

	# Restrict paddle movement within the screen bounds
	position.y = clamp(position.y, player_height / 2, win_height - player_height / 2)
