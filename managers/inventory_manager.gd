extends Node

class_name InvManager

var inventory : Array[InventoryItem]

var expected_item : InventoryItem # excpected item to compare with the selected one, like a specific key

func add_item(item : InventoryItem) -> void:
	inventory.append(item)

func set_expected_item(item_to_expect : InventoryItem):
	expected_item = item_to_expect
