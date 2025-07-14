extends Node2D

var speed := 5

func _ready() -> void:
	print("Hello world and hello sky!")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		$Icon.translate(Vector2(0, -speed))
	if Input.is_action_pressed("ui_down"):
		$Icon.translate(Vector2(0, speed))
	if Input.is_action_pressed("ui_left"):
		$Icon.translate(Vector2(-speed, 0))
	if Input.is_action_pressed("ui_right"):
		$Icon.translate(Vector2(speed, 0))
