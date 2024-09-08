extends Node

var _target_level : String
var _target_level_path : String

func executeTests(target_level : String, target_level_path : String):	
	
	_target_level = target_level
	_target_level_path = target_level_path
	
	_test_target_level_is_defined()
	_test_target_level_is_not_current_level()
	_test_if_target_level_exists()

func _test_target_level_is_defined():

	assert(not _target_level.is_empty(), "Node " 
		+ get_parent().name + "/" + name + " está sem target_level definido")

func _test_target_level_is_not_current_level():

	var current_path : String = get_tree().current_scene.scene_file_path

	var path_divided : PackedStringArray = current_path.split("/")

	var name_with_extension : String = path_divided[-1]

	var name_divided : PackedStringArray = name_with_extension.split(".")

	var current_level_name : String = name_divided[0]

	assert(_target_level != current_level_name, 
		"Node " + get_parent().name + "/" + name + 
		" esta com target_level apontando para o level atual - " + current_level_name)

func _test_if_target_level_exists():

	assert(ResourceLoader.exists(_target_level_path), _target_level_path + " não existe!")
