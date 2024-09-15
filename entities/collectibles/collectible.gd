extends Node

@export var item_data : InventoryItem

func add_to_inventory() -> void:
	
	InventoryManager.add_item(item_data)
	queue_free()

func _on_interactible_handler_player_interacted():
	
	add_to_inventory()