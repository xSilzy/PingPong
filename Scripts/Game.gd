extends Node2D

# Game state variables
var score := -1 # -1 Because the ball get detected at game start 
var time_left = 0

@onready var ball = $ball  # Reference to the ball node


func _process(_delta):
	$HUD/speed.text = str("Speed:", ball.speed/10)
	$HUD.sync_text()

func _ready():
	# Hide the ball at the start of the game
	ball.visible = false
	$HUD/countdown.visible = true
	$HUD/countdownBackground.visible = true
	print("Highscore: ",Global.config.get_value("player","highscore"))
	



func _on_countdown_timeout():
	# Handle countdown logic
	if time_left < 3: 
		Sounds.play_sound("countdown") 
		$Countdown.start(1) # Restart the countdown timer
		$HUD/countdown.text = str(3 - time_left) # Log the remaining countdown time		
		time_left += 1
		$HUD.sync_text()
		
	else:
		# After the countdown, spawn a new ball and make it visible
		Sounds.play_sound("countdown") 
		ball.new_ball()
		ball.visible = true
		$HUD/countdown.visible = false
		$HUD/countdownBackground.visible = false



func _on_player_loose_body_entered(body):
	if body == ball:
		score = -1
		Global.save_data()
		print("Highscore: ",Global.config.get_value("player","highscore"))
		await Global.wait(0.5)
		Sounds.play_sound("fail")
		$Countdown.start(0)



func _on_player_score_area_body_entered(body):
	if body == ball:
		# Increment the score and update the HUD
		if score >= 0:
			Sounds.play_sound("scoreup")
		score += 1
		if Global.highscore <= score:
			Global.highscore = score
		Global.save_data()
		$HUD/playerScore.text = str("Score: ", score)
		$HUD/highscore.text = str("Highscore: ", Global.config.get_value("player","highscore"))
		$HUD.sync_text()



func _on_accel_cooldown_timeout():
	$"."/ball.isOnCooldown = false
