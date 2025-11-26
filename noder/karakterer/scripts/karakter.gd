extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): 
		get_tree().change_scene_to_file("res://scener/hovedmeny.tscn")
