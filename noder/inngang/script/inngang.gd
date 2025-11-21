extends Area2D

@export var next_scene: String = "res://scener/egg_collection_scene.tscn"
var player_at_entrance: bool = false

func _ready() -> void:
	$CanvasLayer/Varsel.visible = false

func _input(event: InputEvent) -> void:
	# Press E
	if event.is_action_pressed("interact") and player_at_entrance:
		get_tree().change_scene_to_file(next_scene)
		
func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		player_at_entrance = true
		$AudioStreamPlayer2D.play()
		$CanvasLayer/Varsel.visible = true
		
func _on_body_exited(body: Node2D) -> void:
	if body is Character:
		player_at_entrance = false
		$CanvasLayer/Varsel.visible = false
