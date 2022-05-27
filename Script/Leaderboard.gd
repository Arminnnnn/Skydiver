extends Control

func _ready():
	$HTTPRequest.request('http://skydiver-api.herokuapp.com/api/Users')

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	var data = json.result
	sort(data)

func sort(data):
	var tempScore = 0;
	var tempName = " ";
	for i in data.size():
		for j in data.size()-1-i:
			if(int(data[j].userHighscore) < int(data[j+1].userHighscore)):
				tempScore = data[j].userHighscore
				data[j].userHighscore = data[j+1].userHighscore
				data[j+1].userHighscore = tempScore
				
				tempName = data[j].userName
				data[j].userName = data[j+1].userName
				data[j+1].userName = tempName
			
		
	setInterfaceData(data)

func setInterfaceData(data):
	var temp = ""
	for i in 10:
		if(i <= 9):
			temp +=  str(data[i].userName) + "\n"
	$Board/Users.text = temp
	
	temp = ""
	for i in 10:
		if(i <= 9):
			temp +=  data[i].userHighscore + "\n"
	$Board/LeaderboardScores.text = temp
