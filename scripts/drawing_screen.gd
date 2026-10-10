extends Node2D

### CONNECTING THE DRAWING BOX TO THE COLOR PICKER 
## AND THE SLIDER
@onready var drawing_box = $drawingBox
@onready var color_picker = $ColorPickerButton
@onready var size_Slider = $WidthSlider
@onready var drawing_box_BG: Panel = $drawingBox # let the user change the background of their sprite
@onready var bg_picker_button: ColorPickerButton = $BGPickerButton

func _ready() -> void:
	color_picker.color_changed.connect(_on_color_changed)
	size_Slider.value_changed.connect(_on_size_changed)
	bg_picker_button.color_changed.connect(_on_bg_color_changed)

func _on_color_changed(color: Color) -> void:
	drawing_box.set_Color(color) # sets the color for the next line

func _on_size_changed(value: float) -> void: 
	drawing_box.set_Marker_Size(value)

func _on_bg_color_changed(color: Color) -> void: 
	drawing_box_BG.self_modulate = color
