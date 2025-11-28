extends Area2D

signal egg_fallen

@export var fall_gravity: float = 300.0
@export var fall_limit: float = 650.0
var velocity := Vector2.ZERO

func _ready():
	add_to_group("eggs")   
	
func _physics_process(delta):
	velocity.y += fall_gravity * delta
	position += velocity * delta
	
	if position.y > fall_limit:
		emit_signal("egg_fallen")
		queue_free()
