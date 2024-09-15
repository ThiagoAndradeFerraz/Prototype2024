extends Node

class_name InvManager

var inventory : Array[InventoryItem]

func add_item(item : InventoryItem) -> void:
    inventory.append(item)
    print("adicionou aaa")
