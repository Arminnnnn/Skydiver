extends ParallaxBackground

export (float) var animationSpeed = 8

func _process(delta):
	if scroll_offset.x >= -10:
		scroll_offset.x -= animationSpeed * delta
	
