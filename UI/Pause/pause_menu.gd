extends CanvasLayer

func _ready():
	
	visible = false

func _unhandled_input(event):
	
	if(event.is_action_pressed("pause")):
		pause_game()

func pause_game() -> void:
	
	visible = not visible
	get_tree().paused = not get_tree().paused

func _on_resume_btn_pressed():

	get_tree().paused = false
	visible = false

func _on_quit_btn_pressed():
	
	get_tree().quit()

func _on_save_btn_pressed():

	SaveManager.save_game()
