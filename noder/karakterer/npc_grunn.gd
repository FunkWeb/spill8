extends CharacterBody2D

@export var npc_name: String = "Ukjent"
@export var speed: float = 50.0

var direction: Vector2 = Vector2.ZERO

func _ready():
	print("NPC klar:", npc_name)
	if has_node("Label"):
		$Label.text = npc_name

	if has_node("AnimatedSprite2D"):
		var sprite_node = $AnimatedSprite2D
		var frames = SpriteFrames.new()

		frames.add_animation("idle")
		var tex = load("res://assets/grafikk/sprites/sprt_placeholder.png")
		if tex:
			frames.add_frame("idle", tex)
			frames.set_animation_speed("idle", 1.0)
			# Ensure the sprite is centered on the node origin so small images appear centered
			sprite_node.centered = true
			# Scale up very small textures to make them readable (keeps aspect ratio)
			var tex_size = tex.get_size()
			if tex_size.y > 0:
				var desired_height = 64
				if tex_size.y < desired_height:
					var scale_factor = float(desired_height) / float(tex_size.y)
					sprite_node.scale = Vector2(scale_factor, scale_factor)
			sprite_node.frames = frames
			sprite_node.animation = "idle"
			sprite_node.play()

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
