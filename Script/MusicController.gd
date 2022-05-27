extends Node2D

var menuIsPlaying = false
var gameIsPlaying = false

func _ready():
	pass
	
func play_BackgroundMusic():
	if !menuIsPlaying:
		$Music.play()
		menuIsPlaying = true
	
func stop_BackgroundMusic():
	$Music.stop()
	menuIsPlaying = false

func play_GameBackgroundMusic():
	if !gameIsPlaying:
		$GameBackgroundMusic.play()
		gameIsPlaying = true
	
func stop_GameBackgroundMusic():
	$GameBackgroundMusic.stop()
	gameIsPlaying = false

func play_ButtonSound():
	$ButtonSound.play()
	
func play_DeathSound():
	$DeathSound.play()
