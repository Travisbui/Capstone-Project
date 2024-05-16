extends CharacterBody2D

const speed = 35
var current_dir = "none"
var push_force = 500.0
@onready var label = $Label

func _ready():
	$AnimatedSprite2D.play("back_idle")

func _physics_process(delta):
	player_movement(delta)
	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed 
		velocity.y = 0 
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")

	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")

func _on_hitbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	Global.speedrun_time = 0.0
	get_tree().change_scene_to_file("res://scenes/ded.tscn")

func _on_interactbox_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	label.visible = true
	set_process_input(true)

func _on_interactbox_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	label.visible = false
	set_process_input(false)
