extends Node

@export var drawing_Box: Panel
@export var saveButton: Button

# following https://www.youtube.com/watch?v=qOLA1qwUCio tutorial, then altering it to fit my needs better
# -----
func _ready() -> void:
	#THIS TAKES THE SIGNAL FROM node_2d AND CONNECTS IT
	# so we can use the button there to send a signal to here to save the drawing as a png
	saveButton.drawing_done.connect(_on_drawing_done) 
	pass # Replace with function body.

func _on_drawing_done():
	print("Test received it's done")
	save_drawing()

func save_drawing(): 
	#screenshot the viewport to use as a png
	var image = get_viewport().get_texture().get_image()
	
	# Clip it to fit just the panel
	var box_Position = drawing_Box.global_position
	var box_Size = drawing_Box.size
	
	var cropped_Image = image.get_region(Rect2(box_Position,box_Size))
	
	#and then take that png and put it into a handy little folder
	var path := "output/"
	_check_and_create_dir(path)
	cropped_Image.save_png(path + "img.png")

func _check_and_create_dir(path: String) -> void:
	var dir_path := path.get_base_dir()
	if not DirAccess.dir_exists_absolute(dir_path):
		DirAccess.make_dir_recursive_absolute(dir_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
