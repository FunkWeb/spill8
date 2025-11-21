extends Area2D

@export var size: Vector2 = Vector2(96, 40)
@export var speed: int = 300
@export var use_mouse: bool = true
@export var clamp_to_viewport: bool = true

func _ready():
	connect("area_entered", Callable(self, "_on_area_entered"))

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("eggs"):
		area.queue_free()
		get_parent().get_node("EggSpawner").egg_caught()
		get_parent().get_node("EggSpawner").spawn_egg()


func _physics_process(delta: float) -> void:
	var dir = 0
	if use_mouse:
		position.x = get_viewport().get_mouse_position().x
	else:
		if Input.is_action_pressed("ui_left"):
			dir -= 1
		if Input.is_action_pressed("ui_right"):
			dir += 1
		position.x += dir * speed * delta

	if clamp_to_viewport:
		var half = size.x * 0.5
		var vw = get_viewport_rect().size
		position.x = clamp(position.x, half, vw.x - half)
