extends CanvasLayer

func _ready():
	visible = false

func _unhandled_input(event):
	
	if(event.is_action_pressed("open_inventory") and not get_tree().paused):
		show_inventory()
	elif(event.is_action_pressed("pause")):
		visible = false

func show_inventory():




	visible = not visible