extends CharacterBody2D

var score : int = 0

const SPEED : int = 200
const GRAVITY = 150
const JUMP_FORCE = -50

@onready var sprite : Sprite2D = get_node("PlayerSprite")

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	# Apply gravity
	if not is_on_floor():
		direction.y += GRAVITY * delta
	else:
		direction.y = 0  # Reset vertical velocity when grounded
	
	# Horizontal movement
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		sprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		sprite.flip_h = true
	
	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		direction.y = JUMP_FORCE
	
	velocity = direction * SPEED
	move_and_slide()
