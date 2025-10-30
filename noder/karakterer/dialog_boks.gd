extends Control

@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label

func _ready() -> void:
	hide()  # Hidden by default

# Changes the dialog text
func set_text(new_text: String) -> void:
	label.text = new_text

# Shows dialog box with specific text
func show_dialog(new_text: String) -> void:
	set_text(new_text)
	show()

# Hides dialog box
func hide_dialog() -> void:
	hide()
