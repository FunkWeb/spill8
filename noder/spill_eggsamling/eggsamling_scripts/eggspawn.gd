extends Node2D

@export var egg_scene: PackedScene
@export var spawn_area_width: float = 427.0
@export var top_y: float = -10.0

var score: int = 0

func _ready():
	if egg_scene == null:
		push_error("egg_scene not assigned!")
		return
	
	spawn_egg()

func spawn_egg() -> void:
	var egg = egg_scene.instantiate()
	if egg == null:
		push_error("Failed to instantiate egg_scene!")
		return
		
	egg.fall_gravity *= 1.10 ** score
	
	var x_pos = randf_range(0.0, spawn_area_width)
	egg.position = Vector2(x_pos, top_y)
	add_child(egg)

	egg.add_to_group("eggs")
	egg.connect("egg_fallen", Callable(self, "_on_egg_fallen"))

func _on_egg_fallen() -> void:
	get_parent().healthLoss()
	spawn_egg()

func egg_caught():
	score += 1
	print("Score is now: ", score)
	get_parent().get_node("RichTextLabel").text = str(score)
	
	
	
