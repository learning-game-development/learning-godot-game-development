extends CharacterBody2D

var score : int = 0

const SPEED : int = 200

#const GRAVITY = 1000
#const JUMP_FORCE = -400
#
#@onready var sprite : Sprite2D = get_node("PlayerSprite")

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		
	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
