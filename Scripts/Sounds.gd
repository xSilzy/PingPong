extends Node
var volume : int = 0 #ranged from -60 dB to 0 dB
var sfx_player = AudioStreamPlayer.new()
var music_player = AudioStreamPlayer.new()
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
	var sfx_index = AudioServer.get_bus_index("SFX")
	var music_index = AudioServer.get_bus_index("MUSIC")
	
	AudioServer.set_bus_volume_db(sfx_index, volume)
	AudioServer.set_bus_volume_db(music_index, volume)
	
	add_child(sfx_player)
	add_child(music_player)



func play_sound(sound):
	if sound in sounds:
		match sound:
			"welcome" : 
				music_player.stream = sounds["welcome"]
				music_player.play()
			"countdown" :
				sfx_player.stream = sounds["countdown"]
			"scoreup" :
				sfx_player.stream = sounds["scoreup"]
				sfx_player.pitch_scale = randf_range(0, 100)
			"hit" : 
				sfx_player.stream = sounds["hit"]
				sfx_player.pitch_scale = randf_range(0, 100)
			"fail" :
				sfx_player.stream = sounds["fail"]
			"buttonHover" : 
				sfx_player.stream = sounds["buttonHover"]
				sfx_player.pitch_scale = randf_range(0, 100)
			"buttonClick" : 
				sfx_player.stream = sounds["buttonClick"]
				sfx_player.pitch_scale = randf_range(0, 100)
		
		
		sfx_player.play()
		sfx_player.pitch_scale = 1.0
	else:
		print("Sound not found or removed")
		
		
	
	
