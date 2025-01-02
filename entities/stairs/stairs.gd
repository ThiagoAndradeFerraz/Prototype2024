extends Area2D

func _on_player_body_entered(body: Node2D):
	_allow_player_to_climb(body, true)

func _on_player_body_exited(body: Node2D):
	_allow_player_to_climb(body, false)

func _allow_player_to_climb(body: Node2D, can_climb: bool):
	
	if (body.is_in_group("player")):
		body.can_climb = can_climb
		print(body.can_climb)