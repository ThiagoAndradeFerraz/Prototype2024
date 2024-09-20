extends Node

class_name InvManager

var inventory : Array[InventoryItem]

var expected_item : InventoryItem # expected item to compare with the selected one, like a specific key

func add_item(item : InventoryItem) -> void:
	print(item.get_path())
	inventory.append(item)

func set_expected_item(item_to_expect : InventoryItem):
	expected_item = item_to_expect

func compare_selected_with_expected(index : int) -> bool:

	if(inventory[index].get_path() == expected_item.get_path()):
		inventory.remove_at(index)
		return true
	else:
		return false

