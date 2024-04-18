extends Area2D

@export var spike_delay = 0.0
@export var spike_integers = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(spike_delay).timeout
	$AnimationPlayer.play("spike_trigger")

func _on_animation_player_animation_finished(spike_trigger):
	await get_tree().create_timer(spike_integers).timeout
	$AnimationPlayer.play("spike_trigger")
