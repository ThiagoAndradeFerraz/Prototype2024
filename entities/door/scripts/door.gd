extends StaticBody2D

@export var is_locked : bool = false
@export var required_item : InventoryItem

@export var target_level : String

var levels_base_path : String = "res://levels/tests/"
var target_level_path : String

func _ready():

	target_level_path = levels_base_path + target_level + ".tscn"

	EventManager.disconnect_interacted_using_inv_item.connect(
		on_event_bus_disconnect_interacted_using_inv_item)

	# TODO: fazer testes com is_locked e required_item

	$"Tests".executeTests(target_level, target_level_path)

func _on_interactible_handler_player_interacted():

	if(not is_locked):
		get_tree().change_scene_to_file(target_level_path)
	
	else:
		print("PLAYER: it's locked...")


func _on_interactible_handler_inventory_opened():

	InventoryManager.set_expected_item(required_item)

	EventManager.interacted_using_inv_item.connect(on_event_bus_interacted_using_inv_item)

func on_event_bus_interacted_using_inv_item():
	print("usou item")

func on_event_bus_disconnect_interacted_using_inv_item():
	EventManager.interacted_using_inv_item.disconnect(on_event_bus_interacted_using_inv_item)