extends TextureRect

func _ready():
	get_node("Label").text = str(SaveHighscore.get_highscore())
	pass
