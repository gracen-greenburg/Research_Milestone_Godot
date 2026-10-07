extends Panel

signal drawing_done

@onready var _lines: Node2D = $Line2D

# Following the Draw Tutorial
# ------
var _pressed: bool = false #not being pressed yet
var _current_line: Line2D = null

# change colors through a color picker: 
var current_Color: Color = Color.BLUE
# change size with hslider:::
var marker_Size: float = 4.0


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT: #WHEN THE LEFT MOUSE BUTTON IS PRESSED --> adds all these points in a line
			_pressed = event.pressed
			
			if _pressed:
				_current_line = Line2D.new()
				_current_line.default_color = current_Color #using a var instead of hard coding the blue into here
				_current_line.width = marker_Size # var instead of hard number
				_lines.add_child(_current_line)
				_current_line.add_point(event.position)
				
	elif event is InputEventMouseMotion and _pressed:
		_current_line.add_point(event.position)
# ------

func done_drawing() -> void:
	print("TEST DRAWING BOX: IT WORKS AND IT'S Done!")
	drawing_done.emit()
	
# Picking a color --> using the colorpicking button
func set_Color(color: Color) -> void:
	current_Color = color

# Picking what size --> using Hslider
func set_Marker_Size(size: float) -> void: 
	marker_Size = size
	print(marker_Size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
