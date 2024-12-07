extends StaticBody2D

# Variables for screen and paddle dimensions, ball position, and movement calculations
var win_height : int
var paddle_height : int
var ball_pos : Vector2
var dist : int
var move_by : int

@onready var ball = $"../ball"  # Reference to the ball node




func _ready():
	# Initialize screen height and calculate scaled paddle height
	win_height = get_viewport_rect().size.y
	paddle_height = $cpuSprite.texture.get_height() * 10 



func _process(delta):
	# Update the ball's position and calculate the distance to it
	ball_pos = ball.position
	dist = position.y - ball_pos.y
	
	# Move the paddle toward the ball
	if abs(dist) > Global.PADDLE_SPEED * delta:
		# Paddle moves at max speed toward the ball
		move_by = Global.PADDLE_SPEED * delta * (dist / abs(dist)) 
	else:
		# Paddle snaps directly to the ball if close enough
		move_by = dist  
	
	# Update paddle position and clamp it within screen bounds
	position.y -= move_by 
	position.y = clamp(position.y, paddle_height / 2, win_height - paddle_height / 2)
