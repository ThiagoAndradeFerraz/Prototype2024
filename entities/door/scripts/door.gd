extends StaticBody2D

@export var target_level : String

var levels_base_path : String = "res://levels/tests/"
var target_level_path : String

func _ready():

	target_level_path = levels_base_path + target_level + ".tscn"

	$"Tests".executeTests(target_level, target_level_path)
	
func _process(_delta):
	pass

func _on_interactible_handler_player_interacted():
	get_tree().change_scene_to_file(target_level_path)
