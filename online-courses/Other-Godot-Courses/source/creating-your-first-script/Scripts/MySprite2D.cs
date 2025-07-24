using Godot;
using System;

public partial class MySprite2D : Sprite2D
{
	private int _speed = 400;
	private float _angularSpeed = Mathf.Pi;
	
	public MySprite2D()
	{
		GD.Print("Hello, world!");
	}
	
	public override void _Ready()
	{
		var button = GetNode<Button>("../Button");
		button.Pressed += OnButtonPressed;
	}

	public override void _Process(double delta)
	{
		Rotation += _angularSpeed * (float)delta;
		var velocity = Vector2.Up.Rotated(Rotation) * _speed;
		Position += velocity * (float)delta;
	}
	
	private void _ProcessManual(double delta)
	{
		var direction = 0;
		if (Input.IsActionPressed("move_left"))
		{
			direction = -1;
		}
		if (Input.IsActionPressed("move_right"))
		{
			direction = 1;
		}
		
		Rotation += _angularSpeed * direction * (float)delta;
		
		var velocity = Vector2.Zero;
		if (Input.IsActionPressed("move_up"))
		{
			velocity = Vector2.Up.Rotated(Rotation) * _speed;
		}
		
		Position += velocity * (float)delta;
	}
	
	private void OnButtonPressed()
	{
		SetProcess(!IsProcessing());
	}
}
