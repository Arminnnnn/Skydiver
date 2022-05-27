extends TextureButton

func _on_PauseButton_pressed():
	MusicController.play_ButtonSound()
	$CanvasLayer/Pause.pauseGame()
	pass
