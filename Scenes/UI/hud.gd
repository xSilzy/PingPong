extends CanvasLayer


# Syncs text of the background text to the foreground text

func sync_text():
	$countdownBackground.text = $countdown.text
	$playerScoreBackground.text = $playerScore.text
