extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0
@onready var sprite: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		rotate_sprite()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func rotate_sprite() -> void: 
	var targetRotation = sprite.rotation_degrees + 90.0 # rotate 90 degrees with each jump
	
	var tween = create_tween() # AND MAKE IT LOOK SMOOTh
	tween.tween_property(sprite,"rotation_degrees", targetRotation, 0.3)\
		.set_trans(Tween.TRANS_QUAD)\
		.set_ease(Tween.EASE_OUT)
	
