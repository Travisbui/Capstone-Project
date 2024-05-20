extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	animated_sprite_2d.play("win")
	await get_tree().create_timer(24).timeout
	$ColorRect.visible = true
	$TheEnd.visible = true
	$MainMenu.visible = true
	$MainMenu.grab_focus()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
