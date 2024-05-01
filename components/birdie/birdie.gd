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
	
	move_and_slide()

func jump():
	velocity.y = JUMP_VELOCITY

func _on_hurt_box_area_2d_area_entered(area):
	death.emit()


func _on_point_collector_area_2d_area_entered(area):
	score.emit()
