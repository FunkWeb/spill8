extends Area2D

class_name Interactable

func _on_body_entered(body: Node2D) -> void:
	print ("NOW!")
	if body.name == "karakter":
		body.interact_pressed.connect(interact)
		
		
func _on_body_exited(body: Node2D) -> void:
	print("Bye!")
	if body.name == "karakter":
		body.interact_pressed.disconnect(interact)
	

func interact(body: CharacterBody2D):
	pass
