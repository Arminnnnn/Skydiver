extends Sprite

export (float) var animationSpeed = 8

func _process(delta):
	if position.y > 38:
		position.y -= animationSpeed * delta
		scale.x += (animationSpeed * delta) / 16
		scale.y += (animationSpeed * delta) / 16
