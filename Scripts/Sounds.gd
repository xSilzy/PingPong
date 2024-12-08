extends Node
var volume : int = 0 #ranged from -60 dB to 0 dB
var sound_player = AudioStreamPlayer.new()
var sounds = {
	"welcome" : preload("res://Sounds/welcome.ogg"),
	"countdown" : preload("res://Sounds/countdown.ogg"),
	"scoreup" : preload("res://Sounds/scoreup.ogg"),
	"hit" : preload("res://Sounds/hit.ogg"),
	"fail" : preload("res://Sounds/fail.ogg"),
	"buttonHover" : preload("res://Sounds/button-hover.ogg"),
	"buttonClick" : preload("res://Sounds/button-click.ogg")
}




func _ready():
	var audio_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(audio_index, volume) 
	
	add_child(sound_player)



func play_sound(sound):
	if sound in sounds:
		match sound:
			"welcome" : 
				sound_player.stream = sounds["welcome"]
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
			"buttonHover" : 
				sound_player.stream = sounds["buttonHover"]
				sound_player.pitch_scale = randf_range(0, 100)
			"buttonClick" : 
				sound_player.stream = sounds["buttonClick"]
				sound_player.pitch_scale = randf_range(0, 100)
			
		sound_player.play()
		sound_player.pitch_scale = 1.0
	else:
		print("Sound not found or removed")
		
		
	
	
