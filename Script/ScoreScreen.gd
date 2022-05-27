extends Control

func _ready():
	$Highscore.text = str(SaveHighscore.get_highscore())
	$Score.text = str(SaveHighscore.get_lastScore())
	MusicController.stop_GameBackgroundMusic()
	
	putRequest()
	pass 

func _on_ResetButton_pressed():
	MusicController.play_ButtonSound()
	get_tree().change_scene("res://Scene/Main.tscn")
	pass 

func pauseGame():
	var newPausedState = not get_tree().paused
	get_tree().paused = not get_tree().paused
	visible = newPausedState

func _on_HTTPPost_request_completed(result, response_code, headers, body):
	pass # Replace with function body.

func putRequest():
	if(SaveHighscore.get_highscore() == SaveHighscore.get_lastScore()):
		var data = {
				"UserName": str(SaveHighscore.get_userName()),
				"UserHighscore": str(SaveHighscore.get_highscore())
			}
		var query = JSON.print(data)
		print(query)
		var headers = ["Content-Type: application/json"]
		$HTTPPut.request("https://skydiver-api.herokuapp.com/api/Users/"+str(SaveHighscore.get_userID()),headers,false,HTTPClient.METHOD_PUT,query)
		print(query)
