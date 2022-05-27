extends TextureButton

func _on_LeaderBoardButton_pressed():
	MusicController.play_ButtonSound()
	get_tree().change_scene("res://Scene/Leaderboard.tscn")
	pass
