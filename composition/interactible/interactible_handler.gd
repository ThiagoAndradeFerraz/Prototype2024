extends Area2D

var playerCanInteract : bool = false

signal player_interacted

func _ready():
	_testIfHasColision()

func _process(_delta):

	if(playerCanInteract and Input.is_action_just_pressed("action")):
		player_interacted.emit()

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

	assert(hasColision, "interactible_handler está sem collisionShape2D")

