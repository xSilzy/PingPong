extends Node
var sound_player = AudioStreamPlayer.new()
var sounds = {
	"countdown" : preload("res://Sounds/countdown.ogg"),
	"scoreup" : preload("res://Sounds/scoreup.ogg"),
	"hit" : preload("res://Sounds/hit.ogg"),
	"fail" : preload("res://Sounds/fail.ogg")
}

func _ready():
	print("sound is Ready")

func play_sound(sound):
	add_child(sound_player)
	if sound in sounds:
		match sound:
			"countdown" :
				sound_player.stream = sounds["countdown"]
			"scoreup" :
				sound_player.stream = sounds["scoreup"]
			"hit" : 
				sound_player.stream = sounds["hit"]
			"fail" :
				sound_player.stream = sounds["fail"]
			
			
		sound_player.play()
	else:
		print("Sound not found or removed")
