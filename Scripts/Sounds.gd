extends Node
var volume : int = 100
var sound_player = AudioStreamPlayer.new()
var sounds = {
	"countdown" : preload("res://Sounds/countdown.ogg"),
	"scoreup" : preload("res://Sounds/scoreup.ogg"),
	"hit" : preload("res://Sounds/hit.ogg"),
	"fail" : preload("res://Sounds/fail.ogg")
}




func _ready():
	var sfx_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(sfx_index, -10) 



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
		
		
	
	
