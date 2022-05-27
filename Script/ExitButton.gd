extends TextureButton

func _on_ExitButton_pressed():
	MusicController.play_ButtonSound()
	MusicController.stop_GameBackgroundMusic()
	get_tree().change_scene("res://Scene/StartMenu.tscn")
	pass
