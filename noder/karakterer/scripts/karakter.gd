extends CharacterBody2D

@export var speed = 200

signal interact_pressed(body)

func _ready():
	if has_node("AnimatedSprite2D"):
		var sprite_node = $AnimatedSprite2D
		var loadPath = "res://assets/grafikk/sprite_resources/" + Globals.dyr[Globals.character_index] + "_animasjon.tres"
		print(loadPath)
		var frames = load(loadPath)

		if frames:
			sprite_node.frames = frames
			sprite_node.animation = "default"
			sprite_node.play()


func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	if abs(input_direction.x) < abs(input_direction.y):
		if input_direction.y > 0:
			$AnimatedSprite2D.play("walk_down")
		else:
			$AnimatedSprite2D.play("walk_up")
	elif abs(input_direction.x) > abs(input_direction.y):
		if input_direction.x > 0:
			$AnimatedSprite2D.play("walk_right")
		else:
			$AnimatedSprite2D.play("walk_left")
	elif input_direction.x == 0 && input_direction.y == 0:
		$AnimatedSprite2D.play("default")
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	if velocity.x != 0 && velocity.y != 0 && !$Gange.playing:
		$Gange.pitch_scale = 1.5 - (randf() / 2)
		$Gange.play(0.12)
	elif(velocity.x == 0 && velocity.y == 0):
		$Gange.stop()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): 
		get_tree().change_scene_to_file("res://scener/hovedmeny.tscn")
	if event.is_action_pressed("interact"):
		interact_pressed.emit(self)
