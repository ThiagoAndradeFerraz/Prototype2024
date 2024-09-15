extends Node

class_name EventBus

signal player_controls_disabled

signal interacted_using_inv_item

signal disconnect_interacted_using_inv_item

# must be called when a object is interacted with a item from the inventory
func notify_interacted_using_inv_item(): 
	interacted_using_inv_item.emit()

func notify_disconnect_interacted_using_inv_item():
	disconnect_interacted_using_inv_item.emit()