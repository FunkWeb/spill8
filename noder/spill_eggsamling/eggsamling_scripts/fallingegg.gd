extends Node2D

signal egg_fallen

var gravity := 300.0
var velocity := Vector2.ZERO
@export var fall_limit := 240.0 

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta

	if position.y > fall_limit:
		emit_signal("egg_fallen")
		queue_free() 
