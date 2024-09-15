extends CanvasLayer

func _ready():
	
	visible = false

func _unhandled_input(event):
	
	if(event.is_action_pressed("open_inventory") and not get_tree().paused):
		show_inventory()
	elif(event.is_action_pressed("pause")):
		visible = false

func show_inventory():

	# TODO: precisa impedir que o jogador ande enquanto estiver aberto

	'''
	TODO:
		* carregar dados do inventário
		* impedir que o jogador ande enquanto estiver com o inventario aberto
	'''

	visible = not visible
