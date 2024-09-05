extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var controls_node : Node

func _ready():

	controls_node = $Controls



func _physics_process(delta):	
	check_move_input(delta)


func check_move_input(delta) -> void:

	var velocity_to_move = controls_node.get_movement_velocity(SPEED, delta)

	if (velocity_to_move != Vector2.ZERO):
		move_and_collide(velocity_to_move)


# func check_move_input(delta) -> void:
# 	#var velocity_to_move = $PlayerControls.move_input(speed, delta)

# 	if (velocity_to_move != Vector2.ZERO):
# 		move_and_collide(velocity_to_move)
