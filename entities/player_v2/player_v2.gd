extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var player_camera : Camera2D

var is_right : bool = true

func _ready():
	player_camera = $"Camera2D"

func _physics_process(delta):

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if(velocity.x < 0):
		if(player_camera.offset.x > -400):
			player_camera.offset.x = player_camera.offset.x - 3

	elif (velocity.x > 0):
		if(player_camera.offset.x < 400):
			player_camera.offset.x = player_camera.offset.x + 3

	move_and_slide()
