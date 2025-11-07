extends Node2D

@export var size: Vector2 = Vector2(96, 40)
@export var color: Color = Color(0.8, 0.6, 0.2, 1)
@export var speed: int = 300
@export var use_mouse: bool = true
@export var clamp_to_viewport: bool = true
@export var show_debug: bool = false

func _ready():
    queue_redraw() # Godot 4.x: use queue_redraw() instead of update()
    # If a Sprite2D child with a texture exists, use its size for clamping by default
    if has_node("Sprite2D"):
        var s = $Sprite2D
        if s.texture:
            size = s.texture.get_size() * s.scale

func _draw():
    # Only draw debug visuals here. The visible sprite is provided by the Sprite2D child.
    if not show_debug:
        return

    # Debug visualization when enabled
    var vw = get_viewport_rect().size
    var half = size.x * 0.5
    # Show movement bounds (relative to node)
    var y_offset = size.y * 0.7
    draw_line(Vector2(-half, y_offset), Vector2(vw.x - half - position.x, y_offset), Color(1,1,1,0.3), 2.0)
    # Show current state
    var state = "Mouse" if use_mouse else "Keyboard"
    # draw_string requires a Font; use fallback if available
    var font = ThemeDB.fallback_font
    var pos_str = "%0.1f" % position.x
    if font:
        draw_string(font, Vector2(-size.x * 0.5, -size.y), state + " | Pos: " + pos_str)

func _physics_process(delta):
    if use_mouse:
        # Follow mouse x position (viewport coordinates)
        var mx = get_viewport().get_mouse_position().x
        position.x = mx
    else:
        var dir = 0
        if Input.is_action_pressed("ui_left"):
            dir -= 1
        if Input.is_action_pressed("ui_right"):
            dir += 1
        if dir != 0:
            position.x += dir * speed * delta

    if clamp_to_viewport:
        var vw = get_viewport_rect().size
        var half = size.x * 0.5
        position.x = clamp(position.x, half, vw.x - half)
