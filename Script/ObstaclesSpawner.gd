extends Node2D

onready var timer = $Timer
var crowSpeed = -1

var Obstacle = preload("res://Scene/Crow.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawnObstacle()

func spawnObstacle():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.updateCrowSpeed(crowSpeed)
	if crowSpeed > -5:
		crowSpeed -= 0.1
	obstacle.position.y = 300
	obstacle.position.x = randi()% 85 + 8
	
	
