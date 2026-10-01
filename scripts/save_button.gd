extends Button

signal drawing_done

# Adding a button to save the game
func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	print("TEST Done Pressed")
	drawing_done.emit()
