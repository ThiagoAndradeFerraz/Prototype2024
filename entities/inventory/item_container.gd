extends Node

class_name ItemContainer

# this class encapsulates the item and extra info like quantity

var item : InventoryItem
var quantity : int

func add_quantity():
	quantity = quantity + 1

func subtract_quantity():

	pass
