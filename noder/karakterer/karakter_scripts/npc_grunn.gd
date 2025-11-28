extends CharacterBody2D

@export_enum("gris", "hone", "hund", "kanin", "katt", "rev", "sau") var npc_type: String = "gris"

var npc_name: String = "Ukjent"
var npc_intro: String
var npc_repeat: String
@export var speed: float = 15.0

var json_string: String = FileAccess.get_file_as_string("res://noder/karakterer/karakter_scripts/npc_info.json")
var json_dict
var direction: Vector2 = Vector2.ZERO
var walk_time: float = 0.0
var elapsed_time: float = 0.0


func _ready():
	if (npc_type == Globals.dyr[Globals.character_index]): get_parent().queue_free()
	json_dict = JSON.parse_string(json_string)

	for npc in json_dict["npcs"]:
		if npc["type"] == npc_type: 
			npc_name = npc["name"]
			npc_intro = npc["greeting"]
			npc_repeat = npc["standardtext"]
		print("NPC klar:", npc_name)
	
	$KarakterInteract.npc_name = npc_name
	$KarakterInteract.npc_type = npc_type
	$KarakterInteract.greeting_text = npc_intro
	$KarakterInteract.repeat_text = npc_repeat
	
	if has_node("Label"):
		$Label.text = npc_name

	if has_node("AnimatedSprite2D"):
		var sprite_node = $AnimatedSprite2D
		var loadPath = "res://assets/grafikk/sprite_resources/" + npc_type + "_animasjon.tres"
		print(loadPath)
		var frames = load(loadPath)

		if frames:
			sprite_node.frames = frames
			sprite_node.animation = "default"
			sprite_node.play()
			#global_position = get_viewport_rect().size / 2

	_choose_new_direction()



func _process(delta):
	elapsed_time += delta

	if elapsed_time >= walk_time:
		_choose_new_direction()


func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

	global_position.x = clamp(global_position.x, -1024, 1024)
	global_position.y = clamp(global_position.y, -576, 576)
	if velocity.x != 0 && velocity.y != 0 && !$Gange.playing:
		$Gange.pitch_scale = 1.5 - (randf() / 2)
		$Gange.play(0.12)
	elif(velocity.x == 0 && velocity.y == 0):
		$Gange.stop()


func _choose_new_direction():
	elapsed_time = 0.0
	walk_time = randf_range(0.5, 3.0)

	var random_angle = randf_range(0, TAU)
	direction = Vector2(cos(random_angle), sin(random_angle)).normalized()

	if randi() % 3 == 0:
		direction = Vector2.ZERO
		$AnimatedSprite2D.play("default")
	if abs(direction.x) < abs(direction.y):
		if direction.y > 0:
			$AnimatedSprite2D.play("walk_down")
		else:
			$AnimatedSprite2D.play("walk_up")
	elif abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			$AnimatedSprite2D.play("walk_right")
		else:
			$AnimatedSprite2D.play("walk_left")
