extends Sprite

export (float) var animationSpeed = 8

func _process(delta):
	if position.y > 27:
		position.y -= animationSpeed * delta
		
