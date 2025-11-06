extends Node2D

var gravity := 300.0
var velocity := Vector2.ZERO

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
