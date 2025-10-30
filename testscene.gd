extends Node2D

func _ready():
	var dialog_scene = load("res://dialog_boks.tscn").instantiate()
	add_child(dialog_scene)
	dialog_scene.set_text("Hei! Dette er en test av NPC-dialogboksen.")
	dialog_scene.show_dialog()
