# kredittering.gd
extends Control

# Funksjon som kalles når 'Tilbake'-knappen trykkes
func _on_tilbake_knapp_pressed():
	# Last inn hovedmenyen på nytt og bytt scene
	get_tree().change_scene_to_file("res://scener/hovedmeny/hovedmeny.tscn")
