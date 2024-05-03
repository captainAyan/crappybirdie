extends Node

var music_player:AudioStreamPlayer
var sfx_player:AudioStreamPlayer
var achievement_sound_player:AudioStreamPlayer
var ui_sound_player:AudioStreamPlayer

var is_mute:bool = false

var bgm:AudioStream
var jump_sound:AudioStream
var death_sound:AudioStream
var high_score_sound:AudioStream
var click_sound:AudioStream

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	
	sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)
	
	achievement_sound_player = AudioStreamPlayer.new()
	add_child(achievement_sound_player)
	
	ui_sound_player = AudioStreamPlayer.new()
	add_child(ui_sound_player)
	
	#Backmusic system
	bgm = preload("res://assets/music/bgm.mp3")
	music_player.stream = bgm
	music_player.play()
	music_player.connect("finished", _on_audio_finished)
	
	jump_sound = preload("res://assets/sfx/jump.mp3")
	death_sound = preload("res://assets/sfx/death.mp3")
	high_score_sound = preload("res://assets/sfx/high_score.mp3")
	click_sound =  preload("res://assets/sfx/click.mp3")

func _on_audio_finished():
	music_player.play()

func mute():
	is_mute = true
	music_player.volume_db = -100

func unmute():
	is_mute = false
	music_player.volume_db = 0

func play_jump_sound():
	sfx_player.stream = jump_sound
	sfx_player.play()

func play_death_sound():
	sfx_player.stream = death_sound
	sfx_player.play()

func play_high_score_sound():
	achievement_sound_player.stream = high_score_sound
	achievement_sound_player.play()

func play_click_sound():
	ui_sound_player.stream = click_sound
	ui_sound_player.play()
	
