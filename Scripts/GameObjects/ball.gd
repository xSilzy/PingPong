extends CharacterBody2D

# Variables for screen size, ball speed, direction, and movement constraints
var win_size : Vector2
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6  # Maximum vertical movement vector for the ball

func _ready():
	# Store the size of the game window
	win_size = get_viewport_rect().size

func new_ball():
	# Initialize ball at a random position and reset its speed and direction
	position.x = win_size.x / 2
	position.y = randi_range(400, win_size.y - 400)  # Random vertical position within bounds
	speed = Global.START_SPEED  # Set initial speed
	dir = random_direction()  # Assign a random movement direction

func _physics_process(delta): 
	# Move the ball and check for collisions
	var collision = move_and_collide(dir * speed * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == $"../playerPaddle" or collider == $"../cpuPaddle":
			# If the ball hits a paddle, increase speed and bounce
			speed += Global.ACCEL
			print("Speed: ", speed)
			
			
			dir = new_direction(collider)
			print("collision normal", dir)
		else:
			# If the ball hits a wall, simply bounce
			dir = dir.bounce(collision.get_normal())

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
