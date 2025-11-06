extends Node2D

@export var egg_scene: PackedScene
@onready var spawn_point: Marker2D = $"../Basket/Marker2D"

func spawn_egg():
	var egg = egg_scene.instantiate()
	get_parent().add_child(egg)
	egg.global_position = spawn_point.global_position

func _ready():
	spawn_egg()
