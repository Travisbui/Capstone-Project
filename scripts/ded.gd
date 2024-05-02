extends Control

func _on_visibility_changed():
	if visible == true:
		get_tree().paused = true
