extends CharacterBody2D

signal troffel_fallen

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	emit_signal("troffel_fallen")
	queue_free()
	
