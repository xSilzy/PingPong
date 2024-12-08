extends CharacterBody2D

# Variables for screen size, ball speed, direction, and movement constraints
var win_size : Vector2
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6  # Maximum vertical movement vector for the ball
const START_SPEED : int = 350  # Initial ball speed
var isOnCooldown : bool = false  # Cooldown state to control acceleration logic

## Speed stages for the ball (defined by maximum speed and acceleration per stage)
const SPEED_STAGES = [
	{"speed": 450, "accel": 50},  # Stage 1
	{"speed": 960, "accel": 40},  # Stage 2
	{"speed": 1770, "accel": 30}, # Stage 3
	{"speed": 3390, "accel": 10}, # Stage 4
	{"speed": 3995, "accel": 5},  # Stage 5
	{"speed": 10000, "accel": 1}  # Stage 6
]




func _ready():
	# Store the size of the game window
	win_size = get_viewport_rect().size



func new_ball():
	# Initialize ball at a random position and reset its speed and direction
	position.x = win_size.x / 2
	position.y = randi_range(400, win_size.y - 400)  # Random vertical position within bounds
	speed = START_SPEED  # Set initial speed
	dir = random_direction()  # Assign a random movement direction



func _physics_process(delta): 
	# Move the ball and check for collisions
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == $"../playerPaddle": 
			speed = ball_speed_stages(speed)
			dir = new_direction(collider)
		elif collider == $"../cpuPaddle": 
			speed = ball_speed_stages(speed)
			dir = dir.bounce(collision.get_normal())
		else:
			# If the ball hits a wall, simply bounce
			dir = dir.bounce(collision.get_normal())
		Sounds.play_sound("hit") # Play hit sound



func random_direction():
	# Generate a random normalized direction vector
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()  # Random horizontal direction
	new_dir.y = randf_range(-1, 1)  # Random vertical direction
	return new_dir.normalized()



func new_direction(collider):
	# Calculate a new direction based on paddle collision
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y  # Distance between ball and paddle center
	var new_dir := Vector2()
	
	# Reverse horizontal direction
	new_dir.x = -1 if dir.x > 0 else 1
	# Adjust vertical direction proportionally to the collision point
	new_dir.y = (dist / (collider.paddle_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()



# Adjust ball speed based on current stage and apply acceleration
func ball_speed_stages(ball_speed):
	if isOnCooldown == false:  # Only proceed if not on cooldown
		for i in range(SPEED_STAGES.size()):
			if ball_speed <= SPEED_STAGES[i].speed: 
				ball_speed += SPEED_STAGES[i].accel 
				isOnCooldown = true  # Set cooldown to prevent re-acceleration
				print("Speed: ", speed)
				break
	$"../accel_cooldown".start(0.08)
	return ball_speed  # Return the updated speed

