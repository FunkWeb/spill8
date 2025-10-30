extends Node2D

@onready var label = $Control/Panel/Label

func _ready():
	# Start hidden
	hide()
	# Wait a moment and show example text
	await get_tree().create_timer(1.0).timeout
	show_text("Hello, traveler! Welcome to the test scene.")

func show_text(text: String):
	label.text = text
	show()

func hide_text():
	hide()
