extends Area2D

@export var speed = 1.0

var direction : float
var spawnPos : Vector2
var spawnRot : float

func _ready():
	await get_tree().create_timer(0.01).timeout
	$CollisionShape2D.disabled = false

func _physics_process(delta):
	global_position.x += speed * delta 

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	queue_free()
