extends Control

func _input(event):
	if event.is_action_pressed("pause"):
		pauseGame()
		
func _on_ResumeButton_pressed():
	pauseGame()
	pass

func _on_TextureButton_pressed():
	MusicController.stop_GameBackgroundMusic()
	pauseGame()
	get_tree().change_scene("res://Scene/StartMenu.tscn")
	pass

func pauseGame():
	var newPausedState = not get_tree().paused
	get_tree().paused = not get_tree().paused
	visible = newPausedState
	play_PauseSound()
	
func play_PauseSound():
	$PauseSound.play()
