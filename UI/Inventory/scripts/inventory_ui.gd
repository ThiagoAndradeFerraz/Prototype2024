extends CanvasLayer

var center_item_index : int = 0

var slot_left_sprite : Sprite2D
var slot_center_sprite : Sprite2D
var slot_right_sprite : Sprite2D

var slot_center_lbl_name : Label
var slot_center_lbl_qty : Label

func _ready():
	slot_left_sprite = $"inventoy_control/control_img_left/Sprite2D"

	slot_center_sprite = $"inventoy_control/control_img_center/Sprite2D"
	slot_center_lbl_name = $"inventoy_control/control_img_center/item_name"
	slot_center_lbl_qty = $"inventoy_control/control_img_center/item_qtd"

	slot_right_sprite = $"inventoy_control/control_img_right/Sprite2D"

	visible = false

func _unhandled_input(event):
	
	if(not get_tree().paused):

		if(event.is_action_pressed("open_inventory") and not get_tree().paused):
			
			if(visible):
				close_inventory()
			else:
				show_inventory()

		elif(event.is_action_pressed("pause")):
			
			close_inventory()

		elif(event.is_action_pressed("select")):
			select_item()			

		elif(event.is_action_pressed("move_right")):

			if(visible): # command valid only if inventory is opened
				if(InventoryManager.inventory.size() > 0):
					center_item_index = center_item_index + 1

					load_items()
		
		elif(event.is_action_pressed("move_left")):

			if(visible): # command valid only if inventory is opened
				if(InventoryManager.inventory.size() > 0):
					center_item_index = center_item_index - 1

					load_items()

func select_item():

	if(not visible or InventoryManager.inventory.size() <= 0):
		return

	if(InventoryManager.expected_item != null):
		
		print(InventoryManager.expected_item.name)
		
		# TODO: compare item. Maybe pass the selected item as argument?
		
		if(InventoryManager.compare_selected_with_expected(center_item_index)):
			EventManager.notify_interacted_using_inv_item() # Notify the interacted item
		
		close_inventory()

	else:
		print("PLAYER: consumiu item")
		close_inventory()

	pass

func show_inventory():

	# TODO: precisa impedir que o jogador ande enquanto estiver aberto
	load_items()
	visible = true

func close_inventory():

	visible = false
	InventoryManager.set_expected_item(null) # reseting the expected item

func load_items():

	reset_ui()

	if(InventoryManager.inventory.size() == 0):
		return

	if(center_item_index > InventoryManager.inventory.size() - 1):
		center_item_index = 0
	
	elif (center_item_index < 0):
		center_item_index = InventoryManager.inventory.size() - 1

	# fill the center

	slot_center_sprite.texture = InventoryManager.inventory[center_item_index].item.inventory_icon
	slot_center_sprite.scale.x = 0.257
	slot_center_sprite.scale.y = 0.257

	slot_center_lbl_name.text = InventoryManager.inventory[center_item_index].item.name
	
	if(not InventoryManager.inventory[center_item_index].item.can_have_multiple):
		slot_center_lbl_qty.text = ""
	else:
		slot_center_lbl_qty.text = str(InventoryManager.inventory[center_item_index].quantity)

	# if has right, fill right

	if(InventoryManager.inventory.size() > 1):

		if(center_item_index == InventoryManager.inventory.size() - 1):
			slot_right_sprite.texture = InventoryManager.inventory[0].item.inventory_icon
		else:
			slot_right_sprite.texture = InventoryManager.inventory[center_item_index + 1].item.inventory_icon
			
		slot_right_sprite.scale.x = 0.155
		slot_right_sprite.scale.y = 0.155

	# if has 3 or more, fill left too

	if(InventoryManager.inventory.size() >= 3):

		if(center_item_index == 0):
			slot_left_sprite.texture = InventoryManager.inventory[InventoryManager.inventory.size() - 1].item.inventory_icon
		else:
			slot_left_sprite.texture = InventoryManager.inventory[center_item_index - 1].item.inventory_icon
			
		slot_left_sprite.scale.x = 0.155
		slot_left_sprite.scale.y = 0.155

func reset_ui():
	slot_left_sprite.texture = null

	slot_center_sprite.texture = null
	slot_center_lbl_name.text = ""

	slot_right_sprite.texture = null
