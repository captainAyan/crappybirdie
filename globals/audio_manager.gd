extends Node

var music_player:AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	
	var bgm:AudioStream = preload("res://assets/music/bgm.mp3")
	music_player.stream = bgm
	music_player.play()

	music_player.connect("finished", _on_audio_finished)

func _on_audio_finished():
	music_player.play()

func mute():
	music_player.volume_db = -100

func unmute():
	music_player.volume_db = 0
