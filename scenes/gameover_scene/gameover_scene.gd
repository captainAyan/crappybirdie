extends Node2D

func _ready():
	$UICanvasLayer/YourScoreLabel.text = "Your Score " + str(ScoreManager.current_score)
	ScoreManager.update_current_score(0)
	$UICanvasLayer/HighScoreLabel.text = "High Score " + str(ScoreManager.high_scores[0])

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_scene/menu_scene.tscn")

func _on_restart_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game_scene/game_scene.tscn")


func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().change_scene_to_file("res://scenes/menu_scene/menu_scene.tscn")
		#get_tree().quit() # default behavior
