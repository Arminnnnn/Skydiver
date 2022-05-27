extends Node

var highscore  = 0 setget set_highscore, get_highscore
var lastScore = 0 setget set_lastScore, get_lastScore
var userName = "keinUserNameVorhanden" setget set_userName, get_userName
var userID = 0 setget set_userID, get_userID

const filepath = "user://score.save"
const filepathUserName = "user://userName.save"
const filepathUserID = "user://userID.save"

func _ready():
	load_score()
	load_userName()
	load_userID()
	pass

func load_score():
	var file = File.new()
	if file.file_exists(filepath): 
		file.open(filepath, File.READ)
		highscore = file.get_var()
	file.close()
	pass

func save_highscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(highscore)
	file.close()
	pass

func set_highscore(newHighscore):
	highscore = newHighscore
	save_highscore()
	pass
	
func get_highscore():
	return highscore

func set_lastScore(newLastScore):
	lastScore = newLastScore
	pass

func get_lastScore():
	return lastScore


#saving UserName	
func set_userName(newUserName):
	userName = newUserName
	save_userName()
	
func get_userName():
	return userName
	
func save_userName():
	var file = File.new()
	file.open(filepathUserName, File.WRITE)
	file.store_var(userName)
	file.close()
	pass

func load_userName():
	var file = File.new()
	if file.file_exists(filepathUserName): 
		file.open(filepathUserName, File.READ)
		userName = file.get_var()
	file.close()
	pass


#saving UserID	
func set_userID(newUserID):
	userID = newUserID
	save_userID()
	
func get_userID():
	return userID
	
func save_userID():
	var file = File.new()
	file.open(filepathUserID, File.WRITE)
	file.store_var(userID)
	file.close()

func load_userID():
	var file = File.new()
	if file.file_exists(filepathUserID): 
		file.open(filepathUserID, File.READ)
		userID= file.get_var()
	file.close()

