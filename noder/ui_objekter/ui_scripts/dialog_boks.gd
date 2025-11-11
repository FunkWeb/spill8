extends Control

@onready var panel: Panel = $Panel
@onready var label: Label = $Panel/Label

func _ready() -> void:
	hide()  # Hide by default

# Sets or updates the dialog text
func set_text(new_text: String) -> void:
	label.text = new_text

# Show the dialog box with text
func show_dialog(new_text: String = "") -> void:
	if new_text != "":
		set_text(new_text)
	show()

# Hide the dialog box
func hide_dialog() -> void:
	hide()

# Optional quick test (press Enter to toggle for now)
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):  # 'Enter' key
		if visible:
			hide_dialog()
		else:
			show_dialog("Hei! Dette er en testdialog.")
