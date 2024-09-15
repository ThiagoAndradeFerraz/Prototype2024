extends CanvasLayer

func _ready():
	
	visible = false

func _unhandled_input(event):
	
	if(not get_tree().paused):

		if(event.is_action_pressed("open_inventory") and not get_tree().paused):
			
			show_inventory()

		elif(event.is_action_pressed("pause")):
			
			visible = false

		elif(event.is_action_pressed("select")):
			
			if(visible):
				select_item()			


func select_item():

	'''
	TODO: Implementar os seguintes cenários:
					
		* Seleção de item sem comparação com algum esperado

		* Seleção de item com comparação de algum item esperado
			* Desconenctar o objeto a ser comparado do sinal
	'''

	if(InventoryManager.expected_item != null):
		
		print(InventoryManager.expected_item.name)
		EventManager.notify_interacted_using_inv_item()
		show_inventory()

	else:

		print("PLAYER: consumiu item")

	pass


func show_inventory():

	# TODO: precisa impedir que o jogador ande enquanto estiver aberto

	'''
	TODO:
		* carregar dados do inventário
		* impedir que o jogador ande enquanto estiver com o inventario aberto
	'''

	visible = not visible

	if(not visible):
		InventoryManager.set_expected_item(null) # reseting the expected item when closing inventory
