extends Area2D

var playerCanInteract : bool = false

signal player_interacted
signal inventory_opened

func _ready():
	_testIfHasColision()

func _process(_delta):

	if(playerCanInteract):

		if(Input.is_action_just_pressed("action")):
			player_interacted.emit()

		elif(Input.is_action_just_pressed("open_inventory")):
			inventory_opened.emit()
			

func _on_area_entered(area:Area2D):

	if(area.is_in_group("player")):
		playerCanInteract = true

func _on_area_exited(_area:Area2D):

	playerCanInteract = false

func _testIfHasColision() -> void:

	var hasColision : bool = false

	for child in get_children():
		if child is CollisionShape2D:
			hasColision = true

	var errorMessage = "Node " + get_parent().name + "/" + name + " está sem collisionShape2D"

	assert(hasColision, errorMessage)

