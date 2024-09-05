extends Node

var velocity : Vector2

func get_movement_velocity(speed, delta) -> Vector2:
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed * delta
	
	return velocity
