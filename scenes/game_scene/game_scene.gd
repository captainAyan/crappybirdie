extends Node2D

var speed:int = 250
var speed_increment:int = 10
var speed_increment_score:int = 10
var mountain_distance = 10

var gameover:bool = false
var high_score_passed = false

enum Gap { SMALL, MID, BIG }
var current_gap_state:Gap = Gap.MID

var is_tutorial_state = true

func _ready():
	$UICanvasLayer/CurrentScoreLabel.text = str(ScoreManager.current_score)
	$UICanvasLayer/HighScoreLabel.text = "High Score " + str(ScoreManager.high_scores[0])

func _on_touch_screen_button_pressed():
	AudioManager.play_jump_sound()
	$Birdie.jump()
	
	if is_tutorial_state:
		$Birdie.is_moving = true
		respawn_pipes()
		
		$TutorialNode2D.hide()
		is_tutorial_state = false


func _process(delta):
	if not gameover:
		if not is_tutorial_state:
			$PipeSetNode2D.position.x -= speed * delta
		
		$Background/Mountains.position.x -= speed/mountain_distance * delta
		$Background/Mountains2.position.x -= speed/mountain_distance * delta
		
		if $Background/Mountains.position.x < -$Background/Mountains.texture.get_width()*2:
			$Background/Mountains.position.x = 1024
		if $Background/Mountains2.position.x < -$Background/Mountains2.texture.get_width()*2:
			$Background/Mountains2.position.x = 1024


func _on_respawn_area_2d_area_entered(area):
	respawn_pipes()

func respawn_pipes():
	#reset gap to Gap.MID
	$PipeSetNode2D.position = Vector2(512, 0)
	if current_gap_state == Gap.SMALL:
		$PipeSetNode2D/Pipe.position.y -= 64
		$PipeSetNode2D/Pipe2.position.y += 64
	elif current_gap_state == Gap.BIG:
		$PipeSetNode2D/Pipe.position.y += 64
		$PipeSetNode2D/Pipe2.position.y -= 64
	
	#select a new gap
	var key = randi() % Gap.size()
	var new_gap_state = key
	
	match new_gap_state:
		Gap.SMALL:
			$PipeSetNode2D/Pipe.position.y += 64
			$PipeSetNode2D/Pipe2.position.y -= 64
			
			#change gap position
			$PipeSetNode2D.position.y = randi_range(1, 8)*-64
		
		Gap.MID:
			#change gap position
			$PipeSetNode2D.position.y = randi_range(0, 9)*-64
		
		Gap.BIG:
			$PipeSetNode2D/Pipe.position.y -= 64
			$PipeSetNode2D/Pipe2.position.y += 64
			
			#change gap position
			$PipeSetNode2D.position.y = randi_range(-1, 10)*-64
	
	current_gap_state = new_gap_state


func _on_birdie_death():
	AudioManager.play_death_sound()
	ScoreManager.update_high_score()
	ScoreManager.save_scores()
	get_tree().change_scene_to_file("res://scenes/gameover_scene/gameover_scene.tscn")


func _on_birdie_score():
	ScoreManager.update_current_score(ScoreManager.current_score + 1)
	$UICanvasLayer/CurrentScoreLabel.text = str(ScoreManager.current_score)
	
	if ScoreManager.current_score % speed_increment_score == 0:
		speed += speed_increment

	if ScoreManager.high_scores[0] < ScoreManager.current_score and not high_score_passed:
		AudioManager.play_high_score_sound()
		high_score_passed = true
