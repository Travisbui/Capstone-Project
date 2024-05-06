extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	animated_sprite_2d.play("ded")
	await get_tree().create_timer(1.75).timeout
	$GameOver.visible = true
	$MainMenu.visible = true
	$MainMenu.grab_focus()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
