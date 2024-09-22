extends Node

class_name SaveMng

func _ready():
	load_game()

func save_game():

	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)

	var save_nodes = get_tree().get_nodes_in_group("persist")

	for node in save_nodes:

		print(node.name)

		# if node.scene_file_path.is_empty():
		# 	print("persistent node '%s' is not an instanced scene, skipped" % node.name)
		# 	continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
		save_file.store_line(json_string)

		print(json_string)

func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		print("aaaa")
	else:
		print("qqqqqqq")