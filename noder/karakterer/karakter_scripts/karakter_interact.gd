extends Interactable

var greeted: bool = false
var greeting_text: String
var repeat_text: String
var npc_name: String
var npc_type: String


func interact(body: CharacterBody2D):
	if !greeted:
		body.get_node("Camera2D/Dialogboks").text_box.text = greeting_text
		greeted = true
	else:
		body.get_node("Camera2D/Dialogboks").text_box.text = repeat_text
	body.get_node("Camera2D/Dialogboks").name_box.text = npc_name
	body.get_node("Camera2D/Dialogboks").visible = true

	super(body)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "karakter":
		$AnimatedSprite2D.visible = true
	super(body)

func _on_body_exited(body: Node2D) -> void:
	if body.name == "karakter":
		body.get_node("Camera2D/Dialogboks").visible = false
		$AnimatedSprite2D.visible = false
	super(body)
