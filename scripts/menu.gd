extends Control

func _ready():
	$VBoxContainer/startbutton.grab_focus()

func _on_startbutton_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_quitbutton_pressed():
	get_tree().quit()
