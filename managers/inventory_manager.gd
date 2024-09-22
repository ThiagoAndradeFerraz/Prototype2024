extends Node

class_name InvManager

#var inventory : Array[InventoryItem]
var inventory : Array[ItemContainer]

var expected_item : InventoryItem # expected item to compare with the selected one, like a specific key

func _ready():
	add_to_group("persist") # info will be saved

func add_item(item : InventoryItem) -> void:
	#print(item.get_path())

	var index_of_item_found = search_item(item.get_path())

	if(index_of_item_found == null):
		var ic : ItemContainer = ItemContainer.new()
		ic.item = item
		ic.quantity = 1

		inventory.append(ic)
	else:
		inventory[index_of_item_found].add_quantity()

func search_item(item_res_path : String):

	var ix : int = 0

	for i in inventory:

		if(i.item.get_path() == item_res_path):
			return ix # return index of found
		else:
			ix = ix + 1

	return null # haven't found

func set_expected_item(item_to_expect : InventoryItem):
	expected_item = item_to_expect

func compare_selected_with_expected(index : int) -> bool:

	if(inventory[index].item.get_path() == expected_item.get_path()):
		inventory.remove_at(index)
		return true
	else:
		return false

func save() -> Dictionary:

	var itens : PackedStringArray = []

	for i in inventory:
		itens.append(i.get_path())

	var save_dict : Dictionary = {
		"inventory": itens
	}

	return save_dict