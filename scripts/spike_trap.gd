extends Area2D

@export var spike_delay = 0.0
@export var spike_interval = 0.0

func _ready():
	await get_tree().create_timer(spike_delay).timeout
	$AnimationPlayer.play("spike_trigger")

func _on_animation_player_animation_finished(spike_trigger):
	await get_tree().create_timer(spike_interval).timeout
	$AnimationPlayer.play("spike_trigger")
