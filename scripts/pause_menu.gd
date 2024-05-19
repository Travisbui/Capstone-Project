extends Control

func _ready():
	self.release_focus()
	hide()
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	self.release_focus()
	$AnimationPlayer.play_backwards("blur")
	await $AnimationPlayer.animation_finished
	hide()

func pause():
	get_tree().paused = true
	$PanelContainer/VBoxContainer/resume.grab_focus()
	show()
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("ui_cancel") and get_tree().paused == true:
		resume()

func _on_resume_pressed():
	resume()

func _on_quit_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()
