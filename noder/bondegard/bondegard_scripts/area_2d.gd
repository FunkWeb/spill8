extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")

func _on_area_entered(body):
	if body.is_in_group("player"):
		# Spilleren går opp rampen – heves litt i Z-indeks
		body.z_index = 2
		print("Spilleren går opp rampen!")

func _on_area_exited(body):
	if body.is_in_group("player"):
		# Spilleren går ned igjen
		body.z_index = 0
		print("Spilleren går ned fra rampen!")
