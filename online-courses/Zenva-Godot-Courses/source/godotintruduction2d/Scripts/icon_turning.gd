extends Sprite2D

var speed : int = 400
var angular_speed : float = PI

func _init() -> void:
	print("Hello, world!")

func _process(delta: float) -> void:
	rotation += angular_speed * delta
	
	var velocity = Vector2.UP.rotated(rotation) * speed
	
	position += velocity * delta
