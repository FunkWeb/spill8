extends Interactable

@export var scene: String = "hovedmeny"
@export var spillnavn: String = "Meny"
@export var spilltext: String = "Til hovedmeny"

func interact(body: CharacterBody2D):
	get_tree().change_scene_to_file("res://scener/"+scene+".tscn")
	super(body)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "karakter":
		body.get_node("Camera2D/Dialogboks").text_box.text = spilltext
		body.get_node("Camera2D/Dialogboks").name_box.text = spillnavn
		body.get_node("Camera2D/Dialogboks").visible = true
		$AnimatedSprite2D.visible = true
	super(body)
	
func _on_body_exited(body: Node2D) -> void:
	if body.name == "karakter":
		body.get_node("Camera2D/Dialogboks").visible = false
		$AnimatedSprite2D.visible = false
	super(body)
