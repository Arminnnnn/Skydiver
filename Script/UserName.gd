extends Control

signal check_end

func _ready():
	var directory = Directory.new()
	var doFileExists = directory.file_exists("user://userName.save")
	
	if(doFileExists):
		get_tree().change_scene("res://Scene/StartMenu.tscn")
	
	pass

func _on_NameSubmit_pressed():
	var t = Timer.new()
	SaveHighscore.set_userName($NameInput.text)
	
	postRequest()
	
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	get_tree().change_scene("res://Scene/StartMenu.tscn")
	pass 

func postRequest():
	var data = {
		"UserName": str(SaveHighscore.get_userName()),
		"UserHighscore": "0"
	}
	var query = JSON.print(data)
	
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request("https://skydiver-api.herokuapp.com/api/Users",headers,false,HTTPClient.METHOD_POST,query)
	print(query)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var data = json.result
	print(data)
	searchUserID(data)

func searchUserID(data):
	if(SaveHighscore.get_userName() == data.userName):
			SaveHighscore.set_userID(data.id)

