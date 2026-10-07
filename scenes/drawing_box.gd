extends Panel

signal drawing_done

@onready var _lines: Node2D = $Line2D

# Following the Draw Tutorial
# ------
var _pressed: bool = false #not being pressed yet
var _current_line: Line2D = null

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT: #WHEN THE LEFT MOUSE BUTTON IS PRESSED --> adds all these points in a line
			_pressed = event.pressed
			
			if _pressed:
				_current_line = Line2D.new()
				_current_line.default_color = Color.BLUE
				_current_line.width = 4
				_lines.add_child(_current_line)
				_current_line.add_point(event.position)
				
	elif event is InputEventMouseMotion and _pressed:
		_current_line.add_point(event.position)
# ------

func done_drawing() -> void:
	print("TEST DRAWING BOX: IT WORKS AND IT'S Done!")
	drawing_done.emit()
	
# Adding a button to save the game

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
