extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -275.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var toggle = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		if animated_sprite.flip_h != toggle:
			animated_sprite.position.x += 10
			toggle = false
	elif direction < 0:
		animated_sprite.flip_h = true
		if animated_sprite.flip_h != toggle:
			animated_sprite.position.x -= 10
			toggle = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
