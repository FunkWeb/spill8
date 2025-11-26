extends Node2D

@export var troffel_scene: PackedScene
@export var spawn_area_width: float = 427.0
@export var top_y: float = -10.0

var score: int = 0
var score_label: Label

func _ready():
	if troffel_scene == null:
		push_error("troffel_scene not assigned!")
		return

	spawn_troffel()

func spawn_troffel() -> void:
	var troffel = troffel_scene.instantiate()
	if troffel == null:
		push_error("Failed to instantiate troffel_scene!")
		return

	var x_pos = randf_range(0.0, spawn_area_width)
	troffel.position = Vector2(x_pos, top_y)
	add_child(troffel)

	troffel.add_to_group("troffels")
	troffel.connect("troffel_fallen", Callable(self, "_on_troffel_fallen"))

func _on_troffel_fallen() -> void:
	spawn_troffel()
