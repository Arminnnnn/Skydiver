extends TextureRect

var score = 0

func _ready():
	pass
	
func _process(delta):
	get_node("Label").text = str(updateScore())
	
func updateScore():
	var scoreRounded
	
	if score == 0:
		score += 0.5
	elif score < 100:
		score *= 1.01
	else:
		score += 1
		
	scoreRounded = ceil(score)
	SaveHighscore.set_lastScore(scoreRounded)
	
	if scoreRounded > SaveHighscore.highscore:
		SaveHighscore.set_highscore(scoreRounded) 
	
	return scoreRounded
