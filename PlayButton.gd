extends Button

# moves from main menu to the character maker
func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/Drawing_Screen.tscn")
	print("MOVING SCENES TEST")
