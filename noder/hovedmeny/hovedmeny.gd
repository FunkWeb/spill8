extends Control

func _ready() -> void:
	setCharacterSprite()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scener/bondegaard.tscn")


func _on_avslutt_pressed() -> void:
	get_tree().quit()


func _on_eggsamling_pressed() -> void:
	get_tree().change_scene_to_file("res://scener/egg_collection_scene.tscn")



func _on_forrige_pressed() -> void:
	Globals.character_index -= 1
	if (Globals.character_index < 0): Globals.character_index = 6
	setCharacterSprite()


func _on_neste_pressed() -> void:
	Globals.character_index += 1
	if (Globals.character_index > 6): Globals.character_index = 0
	setCharacterSprite()
	
func setCharacterSprite():
	if has_node("AnimatedSprite2D"):
		var sprite_node = $AnimatedSprite2D
		var loadPath = "res://assets/grafikk/sprite_resources/" + Globals.dyr[Globals.character_index] + "_animasjon.tres"
		var frames = load(loadPath)

		if frames:
			sprite_node.frames = frames
