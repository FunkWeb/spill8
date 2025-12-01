extends Control

func _on_tilbake_knapp_pressed():
	get_tree().change_scene_to_file("res://scener/hovedmeny.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"): 
		get_tree().change_scene_to_file("res://scener/hovedmeny.tscn")
