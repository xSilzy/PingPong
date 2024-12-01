extends Node2D

# Game state variables
var score := -1 # -1 Because the ball get detected at game start 
var time_left = 0

@onready var ball = $ball  # Reference to the ball node

func _ready():
	# Hide the ball at the start of the game
	ball.visible = false
	
func _on_countdown_timeout():
	# Handle countdown logic
	if time_left < 3: 
		$Countdown.start(1) # Restart the countdown timer
		print( 3 - (time_left))  # Log the remaining countdown time
		time_left += 1
	else:
		# After the countdown, spawn a new ball and make it visible
		ball.new_ball()
		ball.visible = true

func _process(delta):
	pass
 

func _on_player_loose_body_entered(body):
	# Reset countdown when the player loses
	$Countdown.start(1)

	



func _on_player_score_area_body_entered(body):
		if body == ball:
			# Increment the score and update the HUD			
			score += 1
			print("fix me")
			$HUD/playerScore.text = str("Score: ", score)
