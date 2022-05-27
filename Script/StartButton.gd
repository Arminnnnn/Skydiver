extends TextureButton

func _on_StartButton_pressed():
	MusicController.play_ButtonSound()
	get_tree().change_scene("res://Scene/Main.tscn")
	pass
