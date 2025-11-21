extends Node2D

@export var egg_scene: PackedScene
@export var spawn_area_width: float = 427.0
@export var top_y: float = -10.0
@export var score_label_path: NodePath = "ScoreLabel"

var score: int = 0
var score_label: Label

func _ready():
	# FIX: assign the score label
	score_label = get_node(score_label_path)

	if egg_scene == null:
		push_error("egg_scene not assigned!")
		return

	update_score_label()
	spawn_egg()

func spawn_egg() -> void:
	var egg = egg_scene.instantiate()
	if egg == null:
		push_error("Failed to instantiate egg_scene!")
		return

	var x_pos = randf_range(0.0, spawn_area_width)
	egg.position = Vector2(x_pos, top_y)
	add_child(egg)

	egg.add_to_group("eggs")
	egg.connect("egg_fallen", Callable(self, "_on_egg_fallen"))

func _on_egg_fallen() -> void:
	spawn_egg()

func egg_caught():
	score += 1
	update_score_label()
	print("Score is now: ", score)


func update_score_label():
	if score_label:
		score_label.text = "Score: %d" % score
