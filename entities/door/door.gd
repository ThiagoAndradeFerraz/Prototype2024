extends StaticBody2D

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass


func _on_area_2d_body_entered(body:Node2D):


	pass # Replace with function body.


func _on_area_2d_area_entered(area:Area2D):

	print("aaa")

	if(area.is_in_group("player")):
		print("aaaa")


	pass # Replace with function body.
