extends CanvasLayer

@onready var text_box: RichTextLabel = $Container/Bakgrunnsboks/Dialogtekst
@onready var name_box: Label = $Container/Bakgrunnsboks/Navneboks/Karakternavn

# Placeholder text
@export var label_text: String = "Reker har store auge og ein lang bøygd kropp. Det er vanleg å bruke reker som mat. Då kallar ein dei ofte for skaldyr. Det finst 2800 ulike artar reker i verda. Dei lever i alle verdshava. Meir enn 40 artar lever i havet utanfor Noreg."
@export var character_name: String = "Reka Knut"

var time_elapsed: float = 0.0
var wait_time: float = 3.0
var is_typing: bool = false

func _ready() -> void:
	visible = false
	text_box.text = label_text
	name_box.text = character_name
	
func _process(delta: float) -> void:
	_display_text(delta)
	
func _input(event: InputEvent) -> void:
	# Placerholder trigger for dialog box (Press spacebar)
	if event.is_action_pressed("ui_select"):
		if not visible:
			start_dialogue()
		else:
			end_dialogue()
			
func start_dialogue():
	visible = true
	is_typing = true
	wait_time = text_box.text.length() * 0.05 # 50 ms per char, average reading speed
	
func end_dialogue():
	is_typing = false
	visible = false
	time_elapsed = 0.0
	
func _display_text(delta: float):
	if not is_typing:
		return
		
	# Write text with "typewriter effect" 
	if time_elapsed < wait_time:
		time_elapsed += delta
		text_box.visible_ratio = min(time_elapsed/wait_time, 1.0)
	else:
		is_typing = false
