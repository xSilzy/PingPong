## Player
const PADDLE_SPEED : int = 1250

## Ball
const START_SPEED : int = 500
const ACCEL : int = 50


func ball_speed_stages(speed):
	speed += ACCEL

