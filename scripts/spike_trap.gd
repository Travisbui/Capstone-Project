extends Area2D

@export var spike_delay = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(spike_delay).timeout
	$AnimationPlayer.play("spike_trigger")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
