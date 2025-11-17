extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scener/bondegaard.tscn")


func _on_avslutt_pressed() -> void:
	get_tree().quit()


func _on_eggsamling_pressed() -> void:
	get_tree().change_scene_to_file("res://scener/egg_collection_scene.tscn")
