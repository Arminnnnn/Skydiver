extends ParallaxBackground

export (float) var scrollingSpeed = 50.0

func _process(delta):
	scroll_offset.y -= scrollingSpeed * delta

func updateSpeed(var speed):
	if scrollingSpeed < 300:
		scrollingSpeed += speed
	pass
