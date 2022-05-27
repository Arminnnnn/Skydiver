extends TextureRect

func _ready():
	$Label.text = str(SaveHighscore.get_userName())
	pass 
