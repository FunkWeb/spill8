extends CharacterBody2D
class_name Character

var speed: int = 50

func _physics_process(delta: float) -> void:
	var direction_vector: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction_vector * speed

	move_and_slide()
