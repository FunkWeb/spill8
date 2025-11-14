extends CharacterBody2D

@export var npc_name: String = "Ukjent"
@export var speed: float = 50.0

var direction: Vector2 = Vector2.ZERO

func _ready():
	print("NPC klar:", npc_name)
	if has_node("Label"):
		$Label.text = npc_name

	# Setup AnimatedSprite2D frames at runtime using placeholder spritesheet
	if has_node("AnimatedSprite2D"):
		var sprite_node = $AnimatedSprite2D
		var frames = SpriteFrames.new()
		# Create an 'idle' animation and add one frame from the spritesheet
		frames.add_animation("idle")
		var tex = load("res://assets/grafikk/sprites/sprt_placeholder.png")
		if tex:
			frames.add_frame("idle", tex)
			frames.set_animation_speed("idle", 1.0)
			sprite_node.frames = frames
			sprite_node.animation = "idle"
			sprite_node.play()

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
