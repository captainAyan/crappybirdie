extends Node2D


func _ready():
	#ScoreManager.save_scores()
	ScoreManager.load_scores()


func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene/game_scene.tscn")


func _on_high_score_button_pressed():
	get_tree().change_scene_to_file("res://scenes/high_score_scene/high_score_scene.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
