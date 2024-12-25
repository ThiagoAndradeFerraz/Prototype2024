extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_camera: Camera2D
var is_right: bool = true

var climbing: bool = false

func _ready():
	player_camera = $"Camera2D"

func _physics_process(delta):

	handle_gravity(delta)
	handle_jump()
	handle_vertical_input()
	handle_horizontal_input()
	adjust_camera_proximity()
	move_and_slide()

func handle_gravity(delta):
	
	if (not climbing):
		if not is_on_floor():
			velocity.y += gravity * delta

func handle_jump():

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func handle_vertical_input() -> void:
	
	if (climbing):
		var directionVertical = Input.get_axis("move_up", "move_down")
		
		if directionVertical:
			velocity.y = directionVertical * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

func handle_horizontal_input() -> void:

	var directionHorizontal = Input.get_axis("move_left", "move_right")

	if directionHorizontal:
		velocity.x = directionHorizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func adjust_camera_proximity() -> void:
	
	if (velocity.x < 0):
		if (player_camera.offset.x > -400):
			player_camera.offset.x = player_camera.offset.x - 3

	elif (velocity.x > 0):
		if (player_camera.offset.x < 400):
			player_camera.offset.x = player_camera.offset.x + 3
