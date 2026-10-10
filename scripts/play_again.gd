extends Button

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_change_character_pressed() -> void:
	pass # Replace with function body.
