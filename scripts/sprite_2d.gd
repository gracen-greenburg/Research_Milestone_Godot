extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	updateTexture()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateTexture():
	var image = Image.load_from_file("user://output/img.png")
	
	if image == null:
		print("GIRL WHERE IS IT! --> missing the drawing")
		return
	
	var update_texture = ImageTexture.create_from_image(image)
	texture = update_texture
