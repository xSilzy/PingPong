extends Node

## Player constants
const PADDLE_SPEED : int = 1250  # Speed for both paddles
var score : int = 0
var highscore : int = 0


## Ball constants and variables
const START_SPEED : int = 350  # Initial ball speed
var isOnCooldown : bool = false  # Cooldown state to control acceleration logic

## Speed stages for the ball (defined by maximum speed and acceleration per stage)
const SPEED_STAGES = [
	{"speed": 450, "accel": 50},  # Stage 1
	{"speed": 960, "accel": 40},  # Stage 2
	{"speed": 1490, "accel": 10}, # Stage 3
	{"speed": 3000, "accel": 20}, # Stage 4
	{"speed": 3500, "accel": 5},  # Stage 5
	{"speed": 10000, "accel": 1}  # Stage 6
]

# Adjust ball speed based on current stage and apply acceleration
func ball_speed_stages(speed):
	for i in range(SPEED_STAGES.size()):
		if isOnCooldown == false:  # Only proceed if not on cooldown
			if speed <= SPEED_STAGES[i].speed: 
				speed += SPEED_STAGES[i].accel 
				isOnCooldown = true  # Set cooldown to prevent re-acceleration
				break
	print("Speed: ", speed)
	return speed  # Return the updated speed
