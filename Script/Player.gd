extends KinematicBody2D

var MAXSPEED = 100
var ACCELERATION = 300
var FRICTION = 500

var velocity = Vector2.ZERO
var isDead = false

func _physics_process(delta: float) -> void:
	
	if !isDead:
		
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		input_vector = input_vector.normalized()
		
		if input_vector != Vector2.ZERO:
			velocity = velocity.move_toward(input_vector * MAXSPEED, ACCELERATION * delta)
			if velocity.x < 0:
				$PlayerSprite.flip_h = true
			else:
				$PlayerSprite.flip_h = false
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
		velocity = move_and_slide(velocity, Vector2(0, 0), false, 4, 0.785398, false)
		
		for index in get_slide_count():
			var collision = get_slide_collision(index)
			if collision.collider is RigidBody2D:
				playerDeath()
			

func playerDeath():
	isDead = true
	velocity = Vector2(0, 0)
	MusicController.play_DeathSound()
	
	$CollisionShape2D.disabled = true
	get_tree().change_scene("res://Scene/ScoreScreen.tscn")
