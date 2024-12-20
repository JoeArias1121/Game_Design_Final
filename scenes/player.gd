extends CharacterBody2D


const SPEED = 175.0
var INERTIA = 0
const JUMP_VELOCITY = -275.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var toggle = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
		if animated_sprite.flip_h != toggle:
			animated_sprite.position.x += 10
			toggle = false
			print(INERTIA)
			INERTIA = 0
		else:
			INERTIA += 100 * delta
	elif direction < 0:
		animated_sprite.flip_h = true
		if animated_sprite.flip_h != toggle:
			animated_sprite.position.x -= 10
			toggle = true
			print(INERTIA)
			INERTIA = 0
		else:
			INERTIA += 100 * delta
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * (SPEED + INERTIA)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
