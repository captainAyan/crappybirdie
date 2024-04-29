extends CharacterBody2D

signal death
signal score

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()


func _on_hit_box_area_2d_area_entered(area):
	if area is Pipe:
		death.emit()
	elif area.name == "ScoreArea2D":
		score.emit()
