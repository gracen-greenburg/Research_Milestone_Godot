extends Node2D

### CONNECTING THE DRAWING BOX TO THE COLOR PICKER 
@onready var drawing_box = $drawingBox
@onready var color_picker = $ColorPickerButton

func _ready() -> void:
	color_picker.color_changed.connect(_on_color_changed)

func _on_color_changed(color: Color) -> void:
	drawing_box.set_Color(color) # sets the color for the next line
