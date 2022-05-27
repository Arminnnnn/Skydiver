extends Node2D

var score = 0

func _ready():
	MusicController.stop_BackgroundMusic()
	MusicController.play_GameBackgroundMusic()
	
func _process(delta):
	get_node("ParallaxBackground").updateSpeed(0.05)
	pass
	
