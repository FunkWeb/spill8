extends Node2D

@export var egg_scene: PackedScene
@export var spawn_area_width: float = 427.0
@export var top_y: float = -10.0

func _ready() -> void:
	if egg_scene == null:
		push_error("egg_scene not assigned! Drag egg.tscn into Inspector.")
		return

	spawn_egg()  

func spawn_egg() -> void:
	var egg = egg_scene.instantiate()
	var x_pos = randf_range(0.0, spawn_area_width)
	egg.position = Vector2(x_pos, top_y)
	add_child(egg)

	egg.connect("egg_fallen", Callable(self, "_on_egg_fallen"))

func _on_egg_fallen() -> void:
	spawn_egg()
