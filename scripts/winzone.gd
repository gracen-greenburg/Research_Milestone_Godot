extends Area2D

func _on_area_2d_body_entered(body):
	if body.name == "Player": 
		print("IM IN HERE")
		get_tree().change_scene_to_file("res://scenes/WinScreen.tscn")
