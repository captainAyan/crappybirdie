extends Node2D

func _ready():
	$CanvasLayer/HighScore1stPositionLabel.text = "1st Position " + str(ScoreManager.high_scores[0])
	$CanvasLayer/HighScore2ndPositionLabel.text = "2nd Position " + str(ScoreManager.high_scores[1])
	$CanvasLayer/HighScore3rdPositionLabel.text = "3rd Position " + str(ScoreManager.high_scores[2])
	$CanvasLayer/HighScore4thPositionLabel.text = "4th Position " + str(ScoreManager.high_scores[3])
	$CanvasLayer/HighScore5thPositionLabel.text = "5th Position " + str(ScoreManager.high_scores[4])


func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().change_scene_to_file("res://scenes/menu_scene/menu_scene.tscn")
		#get_tree().quit() # default behavior
