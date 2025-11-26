extends CharacterBody2D

@export var speed = 200

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): 
		get_tree().change_scene_to_file("res://scener/hovedmeny.tscn")
