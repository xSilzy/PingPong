extends Node
var volume : int = 0 #ranged from -60 dB to 0 dB
var sound_player = AudioStreamPlayer.new()
var sounds = {
	"countdown" : preload("res://Sounds/countdown.ogg"),
	"scoreup" : preload("res://Sounds/scoreup.ogg"),
	"hit" : preload("res://Sounds/hit.ogg"),
	"fail" : preload("res://Sounds/fail.ogg")
}




func _ready():
	var audio_index = AudioServer.get_bus_index("Master")
	print(audio_index)
	AudioServer.set_bus_volume_db(audio_index, volume) 



func play_sound(sound):
	add_child(sound_player)
	if sound in sounds:
		match sound:
			"countdown" :
				sound_player.stream = sounds["countdown"]
			"scoreup" :
				sound_player.stream = sounds["scoreup"]
				sound_player.pitch_scale = randf_range(0, 100)
			"hit" : 
				sound_player.stream = sounds["hit"]
				sound_player.pitch_scale = randf_range(0, 100)
			"fail" :
				sound_player.stream = sounds["fail"]
			
		sound_player.play()
		sound_player.pitch_scale = 1.0
	else:
		print("Sound not found or removed")
		
		
	
	
