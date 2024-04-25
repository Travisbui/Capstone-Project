extends Area2D

@export var speed = 1.0

var direction : float
var spawnPos : Vector2
var spawnRot : float

func _physics_process(delta):
	global_position.x += -speed * delta 

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
