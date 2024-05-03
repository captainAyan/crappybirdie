extends TextureButton


func _ready():
	if AudioManager.is_mute:
		$UnmuteSprite.show()
	else:
		$MuteSprite.show()


func _on_pressed():
	AudioManager.play_click_sound()
	if AudioManager.is_mute:
		AudioManager.unmute()
		$MuteSprite.show()
		$UnmuteSprite.hide()
	else:
		AudioManager.mute()
		$MuteSprite.hide()
		$UnmuteSprite.show()
