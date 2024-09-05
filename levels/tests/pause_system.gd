extends Control

func _ready():
	#$".".visible = false
	pass

func _process(_delta) -> void:
	
	if(Input.is_action_just_pressed("pause")):
		pause_game()

func pause_game() -> void:

	var isPaused : bool = get_tree().paused

	if(not isPaused):
		$".".show()
	else:
		$".".hide()
	
	#get_tree().paused = not isPaused
