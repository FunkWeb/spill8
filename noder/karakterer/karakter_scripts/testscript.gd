extends CharacterBody2D

class_name NPCGrunn

@export var npc_name: String = "Ukjent"
@export var speed: float = 50.0

var direction: Vector2 = Vector2.ZERO

func _ready():
	print("NPC klar:", npc_name)
	if has_node("Label"):
		$Label.text = npc_name

	if has_node("AnimatedSprite2D"):
		var sprite_node = $AnimatedSprite2D
		var frames = load("res://assets/grafikk/sprites/sprite_frames.tres")
		if frames:
			sprite_node.frames = frames
			sprite_node.animation = "default"
			sprite_node.play()

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
